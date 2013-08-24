// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Video.h instead.

#import <CoreData/CoreData.h>
#import "MediaItem.h"

extern const struct VideoAttributes {
} VideoAttributes;

extern const struct VideoRelationships {
} VideoRelationships;

extern const struct VideoFetchedProperties {
} VideoFetchedProperties;



@interface VideoID : NSManagedObjectID {}
@end

@interface _Video : MediaItem {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (VideoID*)objectID;






@end

@interface _Video (CoreDataGeneratedAccessors)

@end

@interface _Video (CoreDataGeneratedPrimitiveAccessors)


@end
