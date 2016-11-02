
import Foundation

class ChatDataSource: NSObject, UITableViewDataSource {    
    private lazy var messages = [MessageModel]()
    let reuseIdentifier: String

    subscript(path: IndexPath) -> MessageModel? {
        let newIndex = messages.count - path.row - 1
        return messages[newIndex]
    }
    
    init(reuseIdentifier: String) {
        self.reuseIdentifier = reuseIdentifier
    }
    
    func append(message: MessageModel) -> Void {
        messages.append(message)
    }
    
    func clear() -> Void {
        messages = [MessageModel]()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.transform = tableView.transform
        return cell
    }
}
