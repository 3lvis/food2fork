import UIKit
import Sync
import SweetUIKit

class RecipeController: SweetTableController {
    fileprivate var apiClient: APIClient
    fileprivate var dataStore: DataStore
    fileprivate unowned let recipe: Recipe

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        return view
    }()

    lazy var recipeInfoView: RecipeInfoView = {
        let view = RecipeInfoView()
        view.delegate = self

        return view
    }()

    init(recipe: Recipe, apiClient: APIClient = .shared, dataStore: DataStore = .shared) {
        self.apiClient = apiClient
        self.dataStore = dataStore
        self.recipe = recipe

        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = recipe.title!
        view.backgroundColor = UIColor.backgroundColor

        tableView.tableHeaderView = imageView
        tableView.tableFooterView = recipeInfoView
        tableView.backgroundColor = UIColor.backgroundColor
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = CGFloat(50)
        tableView.sectionHeaderHeight = 50

        tableView.register(IngredientCell.self)
        tableView.register(LoadingCell.self)
        tableView.registerHeaderFooter(IngredientsSectionHeaderView.self)

        apiClient.downloadImage(recipe.imageURL) { image, error in
            if let error = error {
                let alertController = UIAlertController.errorAlert(error)
                self.present(alertController, animated: true, completion: nil)
            } else {
                self.imageView.image = image
            }
        }

        apiClient.fetchInfo(for: recipe) { error in
            self.tableView.reloadData()
        }

        recipeInfoView.recipe = recipe
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        imageView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200)
        recipeInfoView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200)
    }
}

extension RecipeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ingredientsCount = recipe.ingredients.count
        return ingredientsCount > 0 ? ingredientsCount : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ingredientsCount = recipe.ingredients.count
        if ingredientsCount > 0 {
            let cell = tableView.dequeue(IngredientCell.self, for: indexPath)
            let ingredient = recipe.ingredients[indexPath.row]
            cell.ingredient = ingredient
            cell.indexPath = indexPath

            return cell
        } else {
            let cell = tableView.dequeue(LoadingCell.self, for: indexPath)

            return cell
        }
    }
}

extension RecipeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: IngredientsSectionHeaderView.reuseIdentifier)
    }
}

extension RecipeController: RecipeInfoViewDelegate {
    func recipeInfoView(_ recipeInfoView: RecipeInfoView, didPressViewInstructionsButton button: UIButton) {
        if let sourceURL = recipe.url, let url = URL(string: sourceURL) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    func recipeInfoView(_ recipeInfoView: RecipeInfoView, didPressViewOriginalButton button: UIButton) {
        if let sourceURL = recipe.sourceURL, let url = URL(string: sourceURL) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
