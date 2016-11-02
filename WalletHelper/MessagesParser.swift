
import UIKit

class MessagesParser: NSObject {
    var contextStorage: ContextStorage
    var payment: WPPayment
    
    init(contextStorage: ContextStorage) {
        self.contextStorage = contextStorage
        payment = WPPayment.create(withDefaultParams: contextStorage.background)
    }
    
    func parse(money: String) -> Bool {
        if let moneyAmount = Int(money) {
            let money = NSNumber(value:moneyAmount)
            payment.moneyAmount = money
            return true
        }
        return false
    }
    
    func parse(product: String) -> Bool {
        if ( !product.isEmpty ) {
            payment.name = product
            return true
        }
        return false
    }
    
    func parse(category: String) -> Bool {
        if (!category.isEmpty) {
            payment.category = WPPaymentCategory.fetchOrCreate(withName: category, context: contextStorage.background) as? WPPaymentCategory
            return true
        }
        return false
    }
    
    func parse(place: String) -> Bool {
        if (!place.isEmpty) {
            payment.category?.place = WPPaymentPlace.fetchOrCreate(withName: place, context: contextStorage.background) as? WPPaymentPlace
            return true
        }
        return false
    }
    
    func parse(card: String) -> Bool {
        var range = "ANSWER_NO".localized.startIndex..<"ANSWER_NO".localized.endIndex
        var yes = card.compare("ANSWER_NO".localized, options: .caseInsensitive,
                               range: range,
                               locale: Locale.current)
        if(yes == ComparisonResult.orderedSame){
            payment.whPaymentType = .cash
            return true
        }
        range = "ANSWER_YES".localized.startIndex..<"ANSWER_YES".localized.endIndex
        yes = card.compare("ANSWER_YES".localized, options: .caseInsensitive,
                               range: range,
                               locale: Locale.current)
        if(yes == ComparisonResult.orderedSame){
            payment.whPaymentType = .card
            return true
        }
        payment.whPaymentType = .unknown
        return false
    }
}
