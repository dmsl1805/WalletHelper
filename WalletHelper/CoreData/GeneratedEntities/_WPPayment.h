// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WPPayment.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

#import "WSEntity.h"

NS_ASSUME_NONNULL_BEGIN

@class WPPaymentCategory;

@interface WPPaymentID : WSEntityID {}
@end

@interface _WPPayment : WSEntity
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WPPaymentID *objectID;

@property (nonatomic, strong, nullable) NSDate* date;

@property (nonatomic, strong, nullable) NSNumber* moneyAmount;

@property (atomic) int32_t moneyAmountValue;
- (int32_t)moneyAmountValue;
- (void)setMoneyAmountValue:(int32_t)value_;

@property (nonatomic, strong, nullable) NSNumber* paymentType;

@property (atomic) int16_t paymentTypeValue;
- (int16_t)paymentTypeValue;
- (void)setPaymentTypeValue:(int16_t)value_;

@property (nonatomic, strong, nullable) WPPaymentCategory *category;

@end

@interface _WPPayment (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSNumber*)primitiveMoneyAmount;
- (void)setPrimitiveMoneyAmount:(NSNumber*)value;

- (int32_t)primitiveMoneyAmountValue;
- (void)setPrimitiveMoneyAmountValue:(int32_t)value_;

- (NSNumber*)primitivePaymentType;
- (void)setPrimitivePaymentType:(NSNumber*)value;

- (int16_t)primitivePaymentTypeValue;
- (void)setPrimitivePaymentTypeValue:(int16_t)value_;

- (WPPaymentCategory*)primitiveCategory;
- (void)setPrimitiveCategory:(WPPaymentCategory*)value;

@end

@interface WPPaymentAttributes: NSObject 
+ (NSString *)date;
+ (NSString *)moneyAmount;
+ (NSString *)paymentType;
@end

@interface WPPaymentRelationships: NSObject
+ (NSString *)category;
@end

NS_ASSUME_NONNULL_END
