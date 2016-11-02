
import UIKit
import SlackTextViewController
import ChameleonFramework

protocol ChatViewControllerActionsPerformer {
    func messageDidSend(message: MessageModel) -> Void
    func performUndo() -> Void
    func performSave() -> Void
}

class ChatViewController: SLKTextViewController {
    
    var dataSource: ChatDataSource?
    var actionsPerformer: ChatViewControllerActionsPerformer?
    
    init() {
        super.init(tableViewStyle: .plain)
        customInit()
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
        customInit()
    }
    
    func customInit() -> Void {
        registerClass(forTextView: ChatTextView.self)
        NotificationCenter.default.addObserver(self.tableView,
                                               selector: #selector(UITableView.reloadData(animated:)),
                                               name: .UIContentSizeCategoryDidChange,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self.tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bounces = true
        shakeToClearEnabled = true
        isKeyboardPanningEnabled = true
        shouldScrollToBottomAfterKeyboardShows = false
        isInverted = true
        typingIndicatorView?.canResignByTouch = true
        
        rightButton.setTitle("Send", for: .normal)
        rightButton.tintColor = UIColor(complementaryFlatColorOf: UIColor.flatPurple())
        
        textInputbar.autoHideRightButton = true
        textInputbar.maxCharCount = 256
        textInputbar.counterStyle = .split
        textInputbar.counterPosition = .top
        textInputbar.charCountLabel.textColor = UIColor(complementaryFlatColorOf: UIColor.flatPurple())
        textInputbar.editorTitle.textColor = UIColor(complementaryFlatColorOf: UIColor.flatPurple())
        leftButton.setImage(#imageLiteral(resourceName: "photo-camera"), for: .normal)
        leftButton.tintColor = UIColor(complementaryFlatColorOf: UIColor.flatPurple())
        
        if let dataSource = self.dataSource {
            self.tableView?.dataSource = dataSource
            self.tableView?.register(ChatTableViewCell.self, forCellReuseIdentifier: dataSource.reuseIdentifier)
        }
    }
    
    override func didPressRightButton(_ sender: Any?) {
        print("\(textInputbar.textView.text)")
        let newAnswer = Message.user(textInputbar.textView.text)
        let message = MessageModel(message: newAnswer, dateCreated: Date())
        
        actionsPerformer?.messageDidSend(message: message)
        textInputbar.textView.text = ""
        self.tableView?.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let message = dataSource?[indexPath] {
            switch message.message {
            case let .user(messageText):
                cell.detailTextLabel?.text = messageText
                cell.textLabel?.text = nil
            case let .bot(botQuestion):
                cell.textLabel?.text = botQuestion.rawValue.localized
                cell.detailTextLabel?.text = nil
            }
        }
    }
    
    @IBAction func didPressSaveButton(_ sender: UIBarButtonItem) {
        actionsPerformer?.performSave()
        actionsPerformer?.performUndo()
        self.tableView?.reloadData()
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func didPressUndoButton(_ sender: AnyObject) {
        actionsPerformer?.performUndo()
        self.tableView?.reloadData()

    }
}
