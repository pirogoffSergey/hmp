// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Author.h instead.

#import <CoreData/CoreData.h>
#import "Composer.h"

extern const struct AuthorAttributes {
} AuthorAttributes;

extern const struct AuthorRelationships {
} AuthorRelationships;

extern const struct AuthorFetchedProperties {
} AuthorFetchedProperties;



@interface AuthorID : NSManagedObjectID {}
@end

@interface _Author : Composer {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AuthorID*)objectID;






@end

@interface _Author (CoreDataGeneratedAccessors)

@end

@interface _Author (CoreDataGeneratedPrimitiveAccessors)


@end
