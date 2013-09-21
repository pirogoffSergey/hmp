// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Composer.h instead.

#import <CoreData/CoreData.h>


extern const struct ComposerAttributes {
	__unsafe_unretained NSString *country;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *pic;
	__unsafe_unretained NSString *uid;
} ComposerAttributes;

extern const struct ComposerRelationships {
} ComposerRelationships;

extern const struct ComposerFetchedProperties {
} ComposerFetchedProperties;




@class UIImage;


@interface ComposerID : NSManagedObjectID {}
@end

@interface _Composer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ComposerID*)objectID;





@property (nonatomic, strong) NSString* country;



//- (BOOL)validateCountry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) UIImage* pic;



//- (BOOL)validatePic:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* uid;



@property int32_t uidValue;
- (int32_t)uidValue;
- (void)setUidValue:(int32_t)value_;

//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;






@end

@interface _Composer (CoreDataGeneratedAccessors)

@end

@interface _Composer (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCountry;
- (void)setPrimitiveCountry:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (UIImage*)primitivePic;
- (void)setPrimitivePic:(UIImage*)value;




- (NSNumber*)primitiveUid;
- (void)setPrimitiveUid:(NSNumber*)value;

- (int32_t)primitiveUidValue;
- (void)setPrimitiveUidValue:(int32_t)value_;




@end
