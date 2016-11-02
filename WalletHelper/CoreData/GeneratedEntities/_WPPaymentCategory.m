// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WPPaymentCategory.m instead.

#import "_WPPaymentCategory.h"

@implementation WPPaymentCategoryID
@end

@implementation _WPPaymentCategory

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PaymentCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PaymentCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PaymentCategory" inManagedObjectContext:moc_];
}

- (WPPaymentCategoryID*)objectID {
	return (WPPaymentCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic lastTransactionDate;

@dynamic payments;

- (NSMutableSet<WPPayment*>*)paymentsSet {
	[self willAccessValueForKey:@"payments"];

	NSMutableSet<WPPayment*> *result = (NSMutableSet<WPPayment*>*)[self mutableSetValueForKey:@"payments"];

	[self didAccessValueForKey:@"payments"];
	return result;
}

@dynamic place;

@end

@implementation WPPaymentCategoryAttributes 
+ (NSString *)lastTransactionDate {
	return @"lastTransactionDate";
}
@end

@implementation WPPaymentCategoryRelationships 
+ (NSString *)payments {
	return @"payments";
}
+ (NSString *)place {
	return @"place";
}
@end

