
import Foundation

protocol TableDataSourceProtocol: UITableViewDataSource, NSFetchedResultsControllerDelegate {
    var fetchRequest: NSFetchRequest<NSFetchRequestResult>? { get }
    var sectionNameKeyPath: String? { get }
}

class TableDataSource: NSObject, TableDataSourceProtocol {
    let reuseIdentifier: String
    let contextStorage: ContextStorage
    var tableView: UITableView?
    
    var frc: NSFetchedResultsController<NSFetchRequestResult>? {
        didSet {
            if let frc = frc  {
                frc.delegate = self
                do {
                    try frc.performFetch()
                } catch {
                    print("FRC PERFORM FETCH ERROR")
                }
            }
        }
    }
    
    var sectionNameKeyPath: String? {
        get {
            return nil
        }
    }

    var fetchRequest: NSFetchRequest<NSFetchRequestResult>? {
        get {
            return nil
        }
    }
    
    init!(contextStorage: ContextStorage!, reuseIdentifier: String!) {
        self.contextStorage = contextStorage
        self.reuseIdentifier = reuseIdentifier
        
        super.init()
        
        defer {
            frc = NSFetchedResultsController (fetchRequest: fetchRequest!,
                                              managedObjectContext: contextStorage.main,
                                              sectionNameKeyPath: sectionNameKeyPath,
                                              cacheName: nil)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = frc?.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = frc?.sections {
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return frc?.sections?[section].name
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let object = frc?.object(at: indexPath) as! NSManagedObject
            contextStorage.main.delete(object)
            contextStorage.saveMain()
        default: break
        }
    }

    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        tableView?.reloadData()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        tableView?.reloadData()
    }
}
