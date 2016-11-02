
import Foundation

class ContextStorage: NSObject {
    var background: NSManagedObjectContext
    var main: NSManagedObjectContext
    
    init(main: NSManagedObjectContext, background: NSManagedObjectContext) {
        self.main = main;
        self.background = background;
        super.init()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(mergeFromNotification(notification:)),
                                               name: NSNotification.Name.NSManagedObjectContextDidSave,
                                               object: background)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func mergeFromNotification(notification: Notification) -> Void {
        main.mergeChanges(fromContextDidSave: notification)
    }
    
    func save() -> Void {
        guard background.hasChanges else {
            return
        }
        
        do {
            try background.save()
        } catch let error as NSError  {
            print("Could not save background context\(error), \(error.userInfo)")
        }
    }
    
    func saveMain() -> Void {
        guard (main.insertedObjects.count == 0) &&
            (main.updatedObjects.count == 0) &&
            (main.deletedObjects.count > 0) else {
                print("MAIN SHOLD BE USED ONLY FOR DELETE OPERATION")
                return
        }
        
        do {
            try main.save()
        } catch let error as NSError  {
            print("Could not save main context\(error), \(error.userInfo)")
        }
    }
}
