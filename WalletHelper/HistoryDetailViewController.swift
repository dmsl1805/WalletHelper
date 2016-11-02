import UIKit

class HistoryDetailViewController: UITableViewController {
    
    var dataSource: TableDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = dataSource
        self.dataSource?.tableView = self.tableView
        self.tableView.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let payment = dataSource?.frc?.object(at: indexPath) as? WPPayment {
            cell.textLabel?.text = payment.name
            if let money = payment.moneyAmount?.intValue {
                cell.detailTextLabel?.text = "\(money) \(payment.whPaymentType.rawValue)"
            }
        }
    }
}

