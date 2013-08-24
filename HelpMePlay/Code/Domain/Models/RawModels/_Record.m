// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Record.m instead.

#import "_Record.h"

const struct RecordAttributes RecordAttributes = {
	.accords = @"accords",
	.cover = @"cover",
	.genre = @"genre",
	.lyrics = @"lyrics",
	.name = @"name",
	.uid = @"uid",
};

const struct RecordRelationships RecordRelationships = {
	.composer = @"composer",
	.relatedMedia = @"relatedMedia",
};

const struct RecordFetchedProperties RecordFetchedProperties = {
};

@implementation RecordID
@end

@implementation _Record

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Record" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Record";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Record" inManagedObjectContext:moc_];
}

- (RecordID*)objectID {
	return (RecordID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"uidValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"uid"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic accords;






@dynamic cover;






@dynamic genre;






@dynamic lyrics;






@dynamic name;






@dynamic uid;



- (int32_t)uidValue {
	NSNumber *result = [self uid];
	return [result intValue];
}

- (void)setUidValue:(int32_t)value_ {
	[self setUid:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveUidValue {
	NSNumber *result = [self primitiveUid];
	return [result intValue];
}

- (void)setPrimitiveUidValue:(int32_t)value_ {
	[self setPrimitiveUid:[NSNumber numberWithInt:value_]];
}





@dynamic composer;

	
- (NSMutableSet*)composerSet {
	[self willAccessValueForKey:@"composer"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"composer"];
  
	[self didAccessValueForKey:@"composer"];
	return result;
}
	

@dynamic relatedMedia;

	
- (NSMutableSet*)relatedMediaSet {
	[self willAccessValueForKey:@"relatedMedia"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"relatedMedia"];
  
	[self didAccessValueForKey:@"relatedMedia"];
	return result;
}
	






@end
