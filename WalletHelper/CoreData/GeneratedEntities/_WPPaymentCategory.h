// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WPPaymentCategory.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

#import "WSEntity.h"

NS_ASSUME_NONNULL_BEGIN

@class WPPayment;
@class WPPaymentPlace;

@interface WPPaymentCategoryID : WSEntityID {}
@end

@interface _WPPaymentCategory : WSEntity
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WPPaymentCategoryID *objectID;

@property (nonatomic, strong, nullable) NSDate* lastTransactionDate;

@property (nonatomic, strong, nullable) NSSet<WPPayment*> *payments;
- (nullable NSMutableSet<WPPayment*>*)paymentsSet;

@property (nonatomic, strong, nullable) WPPaymentPlace *place;

@end

@interface _WPPaymentCategory (PaymentsCoreDataGeneratedAccessors)
- (void)addPayments:(NSSet<WPPayment*>*)value_;
- (void)removePayments:(NSSet<WPPayment*>*)value_;
- (void)addPaymentsObject:(WPPayment*)value_;
- (void)removePaymentsObject:(WPPayment*)value_;

@end

@interface _WPPaymentCategory (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveLastTransactionDate;
- (void)setPrimitiveLastTransactionDate:(NSDate*)value;

- (NSMutableSet<WPPayment*>*)primitivePayments;
- (void)setPrimitivePayments:(NSMutableSet<WPPayment*>*)value;

- (WPPaymentPlace*)primitivePlace;
- (void)setPrimitivePlace:(WPPaymentPlace*)value;

@end

@interface WPPaymentCategoryAttributes: NSObject 
+ (NSString *)lastTransactionDate;
@end

@interface WPPaymentCategoryRelationships: NSObject
+ (NSString *)payments;
+ (NSString *)place;
@end

NS_ASSUME_NONNULL_END
