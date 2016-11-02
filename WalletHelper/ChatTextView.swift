
import UIKit
import SlackTextViewController

class ChatTextView: SLKTextView {
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        backgroundColor = UIColor.white
        placeholder = "Type here"
        placeholderColor = UIColor.flatGray()
        pastableMediaTypes = .images
        layer.borderColor = UIColor.flatTeal().cgColor
    }
}
