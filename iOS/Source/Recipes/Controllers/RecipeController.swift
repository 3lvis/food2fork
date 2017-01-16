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

        tableView.tableHeaderView = imageView
        tableView.tableFooterView = recipeInfoView
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.register(UITableViewCell.self)

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

        imageView.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 200)
        recipeInfoView.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 160)
    }
}

extension RecipeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.ingredients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(UITableViewCell.self, for: indexPath)
        let instruction = recipe.ingredients[indexPath.row]
        cell.textLabel?.text =  instruction

        return cell
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
