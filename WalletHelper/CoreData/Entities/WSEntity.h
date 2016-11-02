#import "_WSEntity.h"

@interface WSEntity : _WSEntity

+ (WSEntity *)fetchOrCreateWithName:(NSString *)name
                            context:(NSManagedObjectContext *)context;

+ (WSEntity *)fetchWithName:(NSString *)name
                  inContext:(NSManagedObjectContext*)context;

+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate
                        context:(NSManagedObjectContext*)context;

+ (NSArray *)fetchAll:(NSManagedObjectContext*)context;

@end
