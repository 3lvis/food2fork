import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var id: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var ingredientsStorage: NSData?
    @NSManaged public var publisher: String?
    @NSManaged public var publisherURL: String?
    @NSManaged public var socialRank: Double
    @NSManaged public var sourceURL: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

}
