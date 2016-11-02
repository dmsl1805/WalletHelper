

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class ContextStorage;

@interface WSDataModel : NSObject

@property (nonatomic, strong, readonly) ContextStorage *contextStorage;

@end
