// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MediaItem.h instead.

#import <CoreData/CoreData.h>


extern const struct MediaItemAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *url;
} MediaItemAttributes;

extern const struct MediaItemRelationships {
} MediaItemRelationships;

extern const struct MediaItemFetchedProperties {
} MediaItemFetchedProperties;





@interface MediaItemID : NSManagedObjectID {}
@end

@interface _MediaItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MediaItemID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* url;



//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;






@end

@interface _MediaItem (CoreDataGeneratedAccessors)

@end

@interface _MediaItem (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;




@end
