// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WPPayment.m instead.

#import "_WPPayment.h"

@implementation WPPaymentID
@end

@implementation _WPPayment

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Payment" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Payment";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Payment" inManagedObjectContext:moc_];
}

- (WPPaymentID*)objectID {
	return (WPPaymentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"moneyAmountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"moneyAmount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"paymentTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"paymentType"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic date;

@dynamic moneyAmount;

- (int32_t)moneyAmountValue {
	NSNumber *result = [self moneyAmount];
	return [result intValue];
}

- (void)setMoneyAmountValue:(int32_t)value_ {
	[self setMoneyAmount:@(value_)];
}

- (int32_t)primitiveMoneyAmountValue {
	NSNumber *result = [self primitiveMoneyAmount];
	return [result intValue];
}

- (void)setPrimitiveMoneyAmountValue:(int32_t)value_ {
	[self setPrimitiveMoneyAmount:@(value_)];
}

@dynamic paymentType;

- (int16_t)paymentTypeValue {
	NSNumber *result = [self paymentType];
	return [result shortValue];
}

- (void)setPaymentTypeValue:(int16_t)value_ {
	[self setPaymentType:@(value_)];
}

- (int16_t)primitivePaymentTypeValue {
	NSNumber *result = [self primitivePaymentType];
	return [result shortValue];
}

- (void)setPrimitivePaymentTypeValue:(int16_t)value_ {
	[self setPrimitivePaymentType:@(value_)];
}

@dynamic category;

@end

@implementation WPPaymentAttributes 
+ (NSString *)date {
	return @"date";
}
+ (NSString *)moneyAmount {
	return @"moneyAmount";
}
+ (NSString *)paymentType {
	return @"paymentType";
}
@end

@implementation WPPaymentRelationships 
+ (NSString *)category {
	return @"category";
}
@end

