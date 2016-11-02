// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WSEntity.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface WSEntityID : NSManagedObjectID {}
@end

@interface _WSEntity : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WSEntityID *objectID;

@property (nonatomic, strong, nullable) NSString* name;

@end

@interface _WSEntity (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

@end

@interface WSEntityAttributes: NSObject 
+ (NSString *)name;
@end

NS_ASSUME_NONNULL_END
