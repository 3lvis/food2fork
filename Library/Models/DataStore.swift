import Foundation
import Sync
import CoreData

class DataStore {
    var dataStack: DataStack

    static let shared: DataStore = DataStore()

    init(bundle: Bundle = .main) {
        dataStack = DataStack(modelName: "DataModel", bundle: bundle, storeType: .inMemory)
    }

    var mainContext: NSManagedObjectContext {
        return dataStack.mainContext
    }
}
