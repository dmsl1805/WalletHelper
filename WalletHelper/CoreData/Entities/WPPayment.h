#import "_WPPayment.h"

@interface WPPayment : _WPPayment

+(WPPayment *)createWithDefaultParams:(NSManagedObjectContext *)context;

@end
