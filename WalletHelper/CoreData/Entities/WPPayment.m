#import "WPPayment.h"
#import "WPPaymentPlace.h"
#import "WPPaymentCategory.h"

@interface WPPayment ()

// Private interface goes here.

@end

@implementation WPPayment

+ (WPPayment *)fetchOrCreateWithName:(NSString *)name
                            context:(NSManagedObjectContext *)context {
    WPPayment *entity =  [[self class] insertInManagedObjectContext:context];
    entity.name = name;
    return entity;
}

+(WPPayment *)createWithDefaultParams:(NSManagedObjectContext *)context {
    WPPayment *payment = (WPPayment *)[WPPayment fetchOrCreateWithName:@"Unidentified" context:context];
    WPPaymentCategory *category = (WPPaymentCategory *)[WPPaymentCategory fetchOrCreateWithName:@"Unidentified" context:context];
    WPPaymentPlace *place = (WPPaymentPlace *)[WPPaymentPlace fetchOrCreateWithName:@"Unidentified" context:context];
    [place addCategoriesObject:category];
    [category addPaymentsObject:payment];
    return payment;
}
@end
