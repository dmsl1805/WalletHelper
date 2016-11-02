#import "WSEntity.h"

@interface WSEntity ()

// Private interface goes here.

@end

@implementation WSEntity

+ (WSEntity *)fetchOrCreateWithName:(NSString *)name
                            context:(NSManagedObjectContext *)context {
    WSEntity *entity = [self fetchWithName:name inContext:context];
    NSString *selfString = [self entityName];
    NSString *created = (entity != nil) ? [NSString stringWithFormat:@"%@ updated",selfString] : [NSString stringWithFormat:@"%@ created",selfString];
    NSLog(@"%@",created);
    if (!entity) {
        entity = [[self class] insertInManagedObjectContext:context];
        entity.name = name;
    }
    return entity;
}

+ (WSEntity *)fetchWithName:(NSString *)name
                  inContext:(NSManagedObjectContext*)context{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", [WSEntityAttributes name], name];
    return [[self fetchWithPredicate:predicate context:context]firstObject];
}

+ (NSArray *)fetchAll:(NSManagedObjectContext*)context {
    return [self fetchWithPredicate:nil context:context];
}

+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate
                        context:(NSManagedObjectContext*)context{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context];
    request.predicate = predicate;
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return results;
}

@end
