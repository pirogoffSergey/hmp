// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Band.h instead.

#import <CoreData/CoreData.h>
#import "Composer.h"

extern const struct BandAttributes {
} BandAttributes;

extern const struct BandRelationships {
} BandRelationships;

extern const struct BandFetchedProperties {
} BandFetchedProperties;



@interface BandID : NSManagedObjectID {}
@end

@interface _Band : Composer {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BandID*)objectID;






@end

@interface _Band (CoreDataGeneratedAccessors)

@end

@interface _Band (CoreDataGeneratedPrimitiveAccessors)


@end
