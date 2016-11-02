import UIKit

class ChatMessagingController: NSObject, ChatViewControllerActionsPerformer {
    var dataSource: ChatDataSource
    var parser: MessagesParser
    var answer = BotAnswers.first
    var contextStorage: ContextStorage
    
    init(dataSource: ChatDataSource, contextStorage: ContextStorage) {
        self.dataSource = dataSource
        self.contextStorage = contextStorage
        parser = MessagesParser(contextStorage: contextStorage)
        
        super.init()
        
        defer {
            dataSource.append(message: MessageModel(message: .bot(answer), dateCreated:Date()))
        }
    }
    
    func messageDidSend(message: MessageModel) -> Void {
        dataSource.append(message: message)
        
        if let newAnswerBot = answer.AnswerFor(message.message, parser: parser) {
            switch newAnswerBot {
            case .error:
                dataSource.clear()
                dataSource.append(message: MessageModel(message: .bot(newAnswerBot), dateCreated:Date()))
                answer = BotAnswers.first
                dataSource.append(message: MessageModel(message: .bot(answer), dateCreated:Date()))
            case let x where x == .last:
                performSave()
                dataSource.append(message: MessageModel(message: .bot(newAnswerBot), dateCreated:Date()))
            default:
                dataSource.append(message: MessageModel(message: .bot(newAnswerBot), dateCreated:Date()))
                answer = newAnswerBot
            }
        } 
    }
    
    func performUndo() -> Void {
        dataSource.clear()
        answer = BotAnswers.first
        dataSource.append(message: MessageModel(message: .bot(answer), dateCreated:Date()))
    }
    
    func performSave() -> Void {
        parser.payment.date = Date()
        parser.payment.category?.lastTransactionDate = parser.payment.date
        contextStorage.save()
    }
}
