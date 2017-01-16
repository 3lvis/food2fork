import Foundation
import DATAStack
import Networking
import Sync
import CoreData
import UIKit

class APIClient {
    private static let domain = "com.recipes.app.apiError"

    var networking: Networking
    var assetsNetworking: Networking

    static let shared: APIClient = APIClient()

    init() {
        networking = Networking(baseURL: "http://food2fork.com")
        networking.disableErrorLogging = true

        assetsNetworking = Networking(baseURL: "http://static.food2fork.com")
        assetsNetworking.disableErrorLogging = true
    }

    static func path(forSearchedTerm searchTerm: String) -> String? {
        let encodedSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        // We need to avoid requests for empty strings.
        guard encodedSearchTerm.characters.count > 0 else {
            return nil
        }

        let path = "/api/search?key=\(Keys.api)&q=\(encodedSearchTerm)"
        return path
    }

    static func path(forRecipe recipe: Recipe) -> String? {
        return "/api/get?key=\(Keys.api)&rId=\(recipe.id!)"
    }

    private var currentSearchRequestID: String?

    func cancelPreviousRequest() {
        if let currentSearchRequestID = currentSearchRequestID {
            networking.cancel(with: currentSearchRequestID)
            self.currentSearchRequestID = nil
        }
    }

    func stopSearch() {
        clearCurrentResults()
        cancelPreviousRequest()
    }

    func search(_ searchTerm: String, dataStore: DataStore = .shared, completion: @escaping (_ error: NSError?) -> ()) {
        // We need to make sure to cancel the previous request before starting the new one to avoid getting unwanted results.
        cancelPreviousRequest()

        guard let path = APIClient.path(forSearchedTerm: searchTerm) else {
            clearCurrentResults(completion: completion)
            return
        }

        self.currentSearchRequestID = networking.GET(path) { json, error in
            if let error = error {
                if error.code != URLError.cancelled.rawValue {
                    completion(error)
                }
            } else {
                let json = json as? [String : AnyObject] ?? [String : AnyObject]()

                // The API sometimes will throw valid status codes but errors in the JSON.
                if let otherAPIError = json["error"] as? String {
                    let error = NSError(domain: APIClient.domain, code: 0, userInfo: [NSLocalizedDescriptionKey: "We had troubles connecting with our servers. Error: \(otherAPIError)."])
                    completion(error)
                } else {
                    let recipes = json["recipes"] as? [[String: AnyObject]] ?? [[String: AnyObject]]()
                    Sync.changes(recipes, inEntityNamed: Recipe.entityName, dataStack: dataStore.dataStack, completion: completion)
                }
            }
        }
    }

    func clearCurrentResults(dataStore: DataStore = .shared, completion: ((_ error: NSError?) -> ())? = nil) {
        let noRecipes = [[String: AnyObject]]()
        Sync.changes(noRecipes, inEntityNamed: Recipe.entityName, dataStack: dataStore.dataStack, completion: nil)
    }

    func fetchInfo(for recipe: Recipe, dataStore: DataStore = .shared, completion: @escaping (_ error: NSError?) -> ()) {
        let path = APIClient.path(forRecipe: recipe)!
        networking.GET(path) { json, error in
            if let error = error, error.code != URLError.cancelled.rawValue {
                completion(error)
            } else {
                DispatchQueue.main.async {
                    let json = json as? [String: AnyObject] ?? [String: AnyObject]()
                    let recipeJSON = json["recipe"] as? [String: AnyObject] ?? [String: AnyObject]()
                    let ingredients = recipeJSON["ingredients"] as? [String] ?? [String]()
                    recipe.ingredientsStorage = NSKeyedArchiver.archivedData(withRootObject: ingredients) as NSData?
                    try! dataStore.mainContext.save()

                    completion(nil)
                }
            }
        }
    }

    @discardableResult
    func downloadImage(_ imageURL: String?, completion: @escaping (_ image: UIImage?, _ error: NSError?) -> (Void)) -> String? {
        if let imageURL = imageURL {
            let (_, path) = Networking.splitBaseURLAndRelativePath(for: imageURL)
            let requestIdentifier = assetsNetworking.downloadImage(path, completion: completion)

            return requestIdentifier
        }

        return nil
    }

    func cancelImageDownload(withRequestID requestID: String) {
        assetsNetworking.cancel(with: requestID)
    }
}
