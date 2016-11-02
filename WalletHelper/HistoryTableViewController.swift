import UIKit

class HistoryTableViewController: UITableViewController {
    var detailViewController: HistoryDetailViewController?
    var dataSource: TableDataSource?
    var contextStorage: ContextStorage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? HistoryDetailViewController
        }
        self.tableView.dataSource = dataSource
        self.dataSource?.tableView = self.tableView
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()

        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed

    }


    @IBAction func insertNewObject(_ sender: AnyObject) {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let path = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! HistoryDetailViewController
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                if let category = dataSource?.frc?.object(at: path) as? WPPaymentCategory {
                    controller.dataSource = PaymentInfoDataSource(categoryName: category.name!, contextStorage: contextStorage!, reuseIdentifier: "HistoryDetailCell")
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let category = dataSource?.frc?.object(at: indexPath) as? WPPaymentCategory {
            cell.textLabel?.text = category.name
            cell.detailTextLabel?.text = category.lastTransactionDateFormatted()
        }
    }

}

