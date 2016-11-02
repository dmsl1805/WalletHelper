
import UIKit

class SettingsViewController: UIViewController {

    @IBAction func settingsDidTap(_ sender: AnyObject) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        } else if let _ = presentingViewController {
            dismiss(animated: true, completion: nil)
        }
    }
}
