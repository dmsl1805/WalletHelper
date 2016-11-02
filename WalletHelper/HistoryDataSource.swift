
import UIKit

class HistoryDataSource: TableDataSource {
    
    override var sectionNameKeyPath: String? {
        get {
            return WPPaymentCategoryRelationships.place() + "." + WSEntityAttributes.name()
        }
    }
    
    override var fetchRequest: NSFetchRequest<NSFetchRequestResult>? {
        get {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:WPPaymentCategory.entityName())
            let firstDescriptor = NSSortDescriptor(key: WPPaymentCategoryAttributes.lastTransactionDate(), ascending: true)
            let secondDescriptor = NSSortDescriptor(key: WSEntityAttributes.name(), ascending: true)
            fetchRequest.sortDescriptors = [firstDescriptor, secondDescriptor]
            return fetchRequest
        }
    }
}
