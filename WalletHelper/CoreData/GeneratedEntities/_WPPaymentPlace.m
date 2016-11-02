// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WPPaymentPlace.m instead.

#import "_WPPaymentPlace.h"

@implementation WPPaymentPlaceID
@end

@implementation _WPPaymentPlace

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PaymentPlace" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PaymentPlace";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PaymentPlace" inManagedObjectContext:moc_];
}

- (WPPaymentPlaceID*)objectID {
	return (WPPaymentPlaceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic categories;

- (NSMutableSet<WPPaymentCategory*>*)categoriesSet {
	[self willAccessValueForKey:@"categories"];

	NSMutableSet<WPPaymentCategory*> *result = (NSMutableSet<WPPaymentCategory*>*)[self mutableSetValueForKey:@"categories"];

	[self didAccessValueForKey:@"categories"];
	return result;
}

@end

@implementation WPPaymentPlaceRelationships 
+ (NSString *)categories {
	return @"categories";
}
@end

