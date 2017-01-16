import Foundation

extension Recipe {
    static let entityName = "Recipe"

    enum Attributes: String {
        case title
    }

    var ingredients: [String] {
        if let unwrappedIngredientsStorage =  ingredientsStorage, let ingredients = NSKeyedUnarchiver.unarchiveObject(with: unwrappedIngredientsStorage as Data) as? [String] {
            return ingredients
        }

        return [String]()
    }

    var rank: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        let rank = numberFormatter.string(from: NSNumber(value: socialRank)) ?? "0"

        return rank
    }
}
