import Foundation
import DATAStack
import CoreData

class DataStore {
    var dataStack: DATAStack

    static let shared: DataStore = DataStore()

    init(bundle: Bundle = .main) {
        dataStack = DATAStack(modelName: "DataModel", bundle: bundle, storeType: .inMemory)
    }

    var mainContext: NSManagedObjectContext {
        return dataStack.mainContext
    }
}
