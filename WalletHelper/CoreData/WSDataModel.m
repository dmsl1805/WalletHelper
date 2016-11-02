
#import "WSDataModel.h"
#import "WalletHelper-Swift.h"

@interface WSDataModel()

@property ( nonatomic, copy ) NSString *modelName;

@property (nonatomic, strong, readwrite) NSManagedObjectContext *backgroundThreadContext;
@property (nonatomic, strong, readwrite) NSManagedObjectContext *mainThreadContext;
@property (nonatomic, strong, readwrite) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong, readwrite) ContextStorage *contextStorage;

@end

@implementation WSDataModel

- (instancetype)init {
    self = [super init];
    if ( self ) {
        self.modelName = @"WalletHelperModel";
        self.contextStorage = [[ContextStorage alloc]initWithMain:self.mainThreadContext
                                                       background:self.backgroundThreadContext];
    }
    return self;
}

- (NSURL *)defaultStoreURL {
    NSError *error = nil;
    BOOL isDirectory;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDir = (NSURL*)[[fileManager URLsForDirectory:NSDocumentDirectory
                                                       inDomains:NSUserDomainMask]
                                   lastObject];
    
    if ( ![fileManager fileExistsAtPath:documentsDir.path
                            isDirectory:&isDirectory]) {
        [fileManager createDirectoryAtPath:documentsDir.path
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:&error];
    }
    if (error) {
        NSLog(@"Can't create folder for store :%@", error);
    }
    NSURL *storeURL = [documentsDir URLByAppendingPathComponent:@"dataBase"];
    return storeURL;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Accessor methods

- (NSManagedObjectContext *)mainThreadContext {
    if (!_mainThreadContext) {
        _mainThreadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _mainThreadContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        _mainThreadContext.undoManager = [NSUndoManager new];
    }
    
    return _mainThreadContext;
}

- (NSManagedObjectContext *)backgroundThreadContext {
    if (!_backgroundThreadContext) {
        _backgroundThreadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        _backgroundThreadContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    
    return _backgroundThreadContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSError *error = nil;
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption : @YES,
                              NSInferMappingModelAutomaticallyOption       : @YES};
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:self.modelName
                                              withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:self.defaultStoreURL
                                                         options:options
                                                           error:&error]) {
        NSLog(@"error when creating persistentStoreCoordinator, error: %@, userInfo: %@", error, error.userInfo);
    }
    return _persistentStoreCoordinator;
}

@end
