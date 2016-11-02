// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WPPaymentPlace.h instead.

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

@interface WPPaymentPlaceID : WSEntityID {}
@end

@interface _WPPaymentPlace : WSEntity
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WPPaymentPlaceID *objectID;

@property (nonatomic, strong, nullable) NSSet<WPPaymentCategory*> *categories;
- (nullable NSMutableSet<WPPaymentCategory*>*)categoriesSet;

@end

@interface _WPPaymentPlace (CategoriesCoreDataGeneratedAccessors)
- (void)addCategories:(NSSet<WPPaymentCategory*>*)value_;
- (void)removeCategories:(NSSet<WPPaymentCategory*>*)value_;
- (void)addCategoriesObject:(WPPaymentCategory*)value_;
- (void)removeCategoriesObject:(WPPaymentCategory*)value_;

@end

@interface _WPPaymentPlace (CoreDataGeneratedPrimitiveAccessors)

- (NSMutableSet<WPPaymentCategory*>*)primitiveCategories;
- (void)setPrimitiveCategories:(NSMutableSet<WPPaymentCategory*>*)value;

@end

@interface WPPaymentPlaceRelationships: NSObject
+ (NSString *)categories;
@end

NS_ASSUME_NONNULL_END
