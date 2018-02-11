import UIKit
import SweetUIKit
import DATASource

class RecipesController: SweetTableController {
    fileprivate var thumbnailDownloadsInProgress = [IndexPath : ThumbnailDownloader]()
    fileprivate var apiClient: APIClient
    fileprivate var dataStore: DataStore

    // Helper variables to check the scrolling speed
    fileprivate var lastOffsetCapture: TimeInterval = 0
    fileprivate var lastOffset = CGPoint.zero

    fileprivate lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.delegate = self

        searchController.searchBar.sizeToFit()
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = UIColor.brandColor
        searchController.searchBar.keyboardAppearance = .dark        

        return searchController
    }()

    fileprivate lazy var dataSource: DATASource = {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: Recipe.Attributes.title.rawValue, ascending: true)]

        let dataSource = DATASource(tableView: self.tableView, cellIdentifier: RecipeCell.reuseIdentifier, fetchRequest: fetchRequest, mainContext: self.dataStore.mainContext)
        dataSource.delegate = self
        dataSource.animations = [.insert: .fade, .delete: .fade, .move: .fade, .update: .fade]

        return dataSource
    }()

    lazy var searchStateView: SearchStateView = {
        let view = SearchStateView(withAutoLayout: true)

        return view
    }()

    init(apiClient: APIClient = .shared, dataStore: DataStore = .shared) {
        self.apiClient = apiClient
        self.dataStore = dataStore

        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Food2Fork", comment: "")
        view.backgroundColor = UIColor.backgroundColor
        navigationItem.titleView = searchController.searchBar
        view.addSubview(searchStateView)
        searchStateView.fillSuperview()

        tableView.backgroundColor = UIColor.backgroundColor
        tableView.rowHeight = 200
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.register(RecipeCell.self)
        tableView.alpha = 0
        tableView.separatorStyle = .none
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        if dataSource.isEmpty {
            searchStateView.state = .searchPending
        } else {
            searchStateView.state = .displayingResults
        }
    }

    func startThumbnailDownload(recipe: Recipe, forIndexPath indexPath: IndexPath) {
        guard thumbnailDownloadsInProgress[indexPath] == nil else { return }

        if let thumbnailDownloader = ThumbnailDownloader(recipe: recipe, indexPath: indexPath) {
            thumbnailDownloader.delegate = self
            thumbnailDownloadsInProgress[indexPath] = thumbnailDownloader
            thumbnailDownloader.startDownload()
        }
    }

    func resetSearch() {
        searchStateView.state = .searchPending
        apiClient.stopSearch()
    }
}

extension RecipesController: DATASourceDelegate {
    func dataSource(_ dataSource: DATASource, configureTableViewCell cell: UITableViewCell, withItem item: NSManagedObject, atIndexPath indexPath: IndexPath) {
        let cell = cell as! RecipeCell
        let recipe = item as! Recipe

        cell.recipe = recipe
        startThumbnailDownload(recipe: recipe, forIndexPath: indexPath)
    }
}

extension RecipesController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Stop scrolling to avoid dimissing the keyboard while searching
        tableView.isScrollEnabled = false
        tableView.isScrollEnabled = true

        let searchedText = searchController.searchBar.text ?? ""
        if searchedText.count == 0 {
            tableView.alpha = 0
            resetSearch()
        } else {

            let operations = Array(thumbnailDownloadsInProgress.values)
            operations.forEach { $0.cancelDownload() }
            thumbnailDownloadsInProgress.removeAll()

            searchStateView.state = .searching

            apiClient.search(searchedText) { error in
                if error != nil || self.dataSource.isEmpty {
                    self.tableView.alpha = 0
                    self.searchStateView.state = .noResultsFound

                    if let error = error {
                        let alertController = UIAlertController.errorAlert(error)
                        self.searchController.present(alertController, animated: true, completion: nil)
                    }
                } else {
                    self.tableView.alpha = 1
                    self.searchStateView.state = .displayingResults
                }
            }
        }
    }
}

extension RecipesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.dismiss(animated: true, completion: nil)

        if let recipe = dataSource.object(indexPath) as? Recipe {
            // Needed to be able to remove the title from the back button and keep only the arrow.
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

            let controller = RecipeController(recipe: recipe)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension RecipesController: ThumbnailDownloaderDelegate {
    func thumbnailDownloader(_ thumbnailDownloader: ThumbnailDownloader, didFinishDownloadingImage image: UIImage? , error: NSError?) {
        guard let cell = tableView.cellForRow(at: thumbnailDownloader.indexPath) as? RecipeCell else { return }

        if let image = image {
            cell.thumbnailImageView.image = image

            if cell.thumbnailImageView.alpha == 0 {
                UIView.animate(withDuration: 0.3, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
                    cell.thumbnailImageView.alpha = 1
                }, completion: nil)
            }
        } else {
            cell.thumbnailImageView.alpha = 0
            cell.thumbnailImageView.image = nil
        }

        thumbnailDownloadsInProgress.removeValue(forKey: thumbnailDownloader.indexPath)
    }
}

extension RecipesController: UISearchControllerDelegate {
    func didDismissSearchController(_ searchController: UISearchController) {
        resetSearch()
    }
}

extension RecipesController: UIScrollViewDelegate {
    // We need this to check whether we should dismiss the keyboard or not.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset
        let currentTime = Date.timeIntervalSinceReferenceDate
        let timeDifference = currentTime - lastOffsetCapture

        var isScrollingFast = false
        if timeDifference > 0.1 {
            let distance = Float(currentOffset.y - lastOffset.y)
            let scrollSpeedNotAbsolute = Float((distance * 10.0) / 1000.0)
            let scrollSpeed = fabsf(scrollSpeedNotAbsolute)
            if scrollSpeed > 1 {
                isScrollingFast = true
            } else {
                isScrollingFast = false
            }

            lastOffset = currentOffset
            lastOffsetCapture = currentTime
        }

        if currentOffset.x == 0 && currentOffset.y == 0 {
            isScrollingFast = false
        }

        if isScrollingFast {
            searchController.searchBar.resignFirstResponder()
        }
    }
}
