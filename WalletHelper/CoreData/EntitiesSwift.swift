
import Foundation

protocol name {
    func newname()
}
enum PaymentType: String, name {
    case card = "💳"
    case cash = "💵"
    case unknown = ""
 
    
    func newname() {
    }
}

extension WPPayment {
    var whPaymentType: PaymentType {
        get{
            switch self.paymentType {
            case NSNumber(value: 0)?:
                return .card
            case NSNumber(value: 1)?:
                return .cash
            default:
                return .unknown
            }
        }
        set {
            switch newValue {
            case .card:
                self.paymentType = 0
            case .cash:
                self.paymentType = 1
            default:
                self.paymentType = 2
            }
        }
    }
}
