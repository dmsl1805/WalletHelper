
import UIKit

enum BotAnswers: String {
    case money = "CASE_MONEY"
    case product = "CASE_PRODUCT"
    case category = "CASE_CATEGORY"
    case place = "CASE_PLACE"
    case card = "CASE_CARD"
    case thanks = "CASE_THANKS"
    case error = "CASE_ERROR"
}

enum Message {
    case user(String)
    indirect case bot(BotAnswers)
}

struct MessageModel {
    let message: Message
    let dateCreated: Date
}


extension BotAnswers {
    
    var next: BotAnswers? {
        get{
            switch self {
            case .money: return .product
            case .product: return .category
            case .category: return .place
            case .place: return .card
            case .card: return .thanks
            case .thanks: return nil
            case .error: return .error
            }
        }
    }
    
    static var first: BotAnswers {
        get {
            return .money
        }
    }
    
    static var last: BotAnswers {
        get {
            return .thanks
        }
    }
    
    func AnswerFor(_ message: Message, parser: MessagesParser) -> BotAnswers? {
        switch self {
        case .money:
            switch message {
            case let .user(message):
                if parser.parse(money: message) {
                    return next
                } else {
                    return .error
                }
            default:
                return nil
            }
        case .product:
            switch message {
            case let .user(message):
                if parser.parse(product: message) {
                    return next
                } else {
                    return .error
                }
            default:
                return nil
            }
        case .category:
            switch message {
            case let .user(message):
                if parser.parse(category: message) {
                    return next
                } else {
                    return .error
                }
        default:
            return nil
            }
        case .place:
            switch message {
            case let .user(message):
                if parser.parse(place: message) {
                    return next
                } else {
                    return .error
                }
            default:
                return nil
            }
        case .card:
            switch message {
            case let .user(message):
                if parser.parse(card: message) {
                    return next
                } else {
                    return .error
                }
            default:
                return nil
            }
        default: return next
        }
    }
}

