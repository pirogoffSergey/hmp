// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Genre.h instead.

#import <CoreData/CoreData.h>


extern const struct GenreAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} GenreAttributes;

extern const struct GenreRelationships {
} GenreRelationships;

extern const struct GenreFetchedProperties {
} GenreFetchedProperties;





@interface GenreID : NSManagedObjectID {}
@end

@interface _Genre : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GenreID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* uid;



@property int32_t uidValue;
- (int32_t)uidValue;
- (void)setUidValue:(int32_t)value_;

//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;






@end

@interface _Genre (CoreDataGeneratedAccessors)

@end

@interface _Genre (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveUid;
- (void)setPrimitiveUid:(NSNumber*)value;

- (int32_t)primitiveUidValue;
- (void)setPrimitiveUidValue:(int32_t)value_;




@end
