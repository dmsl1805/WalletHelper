
import Foundation

class PaymentInfoDataSource : TableDataSource {
    var categoryName: String
    
    override var sectionNameKeyPath: String? {
        get {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override var fetchRequest: NSFetchRequest<NSFetchRequestResult>? {
        get {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:WPPayment.entityName())
            let firstDescriptor = NSSortDescriptor(key: WPPaymentAttributes.date(), ascending: true)
            let secondDescriptor = NSSortDescriptor(key: WSEntityAttributes.name(), ascending: true)
            fetchRequest.sortDescriptors = [firstDescriptor, secondDescriptor]
            fetchRequest.predicate = NSPredicate(format: "%K.%K == %@", WPPaymentRelationships.category(), WSEntityAttributes.name(), categoryName)
            return fetchRequest
        }
    }
    
    init(categoryName: String, contextStorage: ContextStorage!, reuseIdentifier: String!) {
        self.categoryName = categoryName
        super.init(contextStorage: contextStorage, reuseIdentifier: reuseIdentifier)
    }
}
