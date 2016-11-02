#import "WPPaymentCategory.h"

@interface WPPaymentCategory ()

// Private interface goes here.

@end

@implementation WPPaymentCategory

- (NSString *)lastTransactionDateFormatted {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd/MM/YYYY";
    return [formatter stringFromDate:self.lastTransactionDate];
}

@end
