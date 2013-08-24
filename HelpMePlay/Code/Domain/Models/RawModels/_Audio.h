// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Audio.h instead.

#import <CoreData/CoreData.h>
#import "MediaItem.h"

extern const struct AudioAttributes {
} AudioAttributes;

extern const struct AudioRelationships {
} AudioRelationships;

extern const struct AudioFetchedProperties {
} AudioFetchedProperties;



@interface AudioID : NSManagedObjectID {}
@end

@interface _Audio : MediaItem {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AudioID*)objectID;






@end

@interface _Audio (CoreDataGeneratedAccessors)

@end

@interface _Audio (CoreDataGeneratedPrimitiveAccessors)


@end
