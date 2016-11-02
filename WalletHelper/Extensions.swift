
import Foundation

extension UITableView {
    func reloadData(animated:Bool) -> Void {
        reloadData()
        if animated {
            let animation = CATransition()
            animation.type = kCATransitionFade
            animation.duration = 0.3
            layer.add(animation, forKey: "UITableViewReloadDataAnimationKey")
        }
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
