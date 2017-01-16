import UIKit
import XCTest
import CoreData
import Sync

class APIClientTests: XCTestCase {
    func testPathForSearchedTerm() {
        XCTAssertNil(APIClient.path(forSearchedTerm: ""))
        XCTAssertEqual(APIClient.path(forSearchedTerm: "something with space"), "/api/search?key=\(Keys.api)&q=something%20with%20space")
    }

    func testSearch() {
        let bundle = Bundle(for: APIClientTests.self)
        let apiClient = APIClient()
        let dataStore = DataStore(bundle: bundle)

        let searchTerm = "Chicken Grilled"
        let path = APIClient.path(forSearchedTerm: searchTerm)!
        apiClient.networking.fakeGET(path, fileName: "sample-search.json", bundle: bundle)
        apiClient.search(searchTerm, dataStore: dataStore) { error in
            if let _ = error {
                XCTFail()
            } else {
                let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
                let result = try! dataStore.mainContext.fetch(fetchRequest)
                XCTAssertEqual(result.count, 1)

                let recipe = try! Sync.fetch("35171", inEntityNamed: Recipe.entityName, using: dataStore.mainContext) as! Recipe
                XCTAssertEqual(recipe.socialRank, 100)
                XCTAssertEqual(recipe.url, "http://food2fork.com/view/35171")
                XCTAssertEqual(recipe.id, "35171")
                XCTAssertEqual(recipe.imageURL, "http://static.food2fork.com/Buffalo2BChicken2BGrilled2BCheese2BSandwich2B5002B4983f2702fe4.jpg")
                XCTAssertEqual(recipe.publisher, "Closet Cooking")
                XCTAssertEqual(recipe.publisherURL, "http://closetcooking.com")
                XCTAssertEqual(recipe.sourceURL, "http://www.closetcooking.com/2011/08/buffalo-chicken-grilled-cheese-sandwich.html")
                XCTAssertEqual(recipe.title, "Buffalo Chicken Grilled Cheese Sandwich")
            }
        }
    }
}
