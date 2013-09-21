// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Author.h instead.

#import <CoreData/CoreData.h>
#import "Composer.h"

extern const struct AuthorAttributes {
	__unsafe_unretained NSString *gender;
	__unsafe_unretained NSString *lastName;
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





@property (nonatomic, strong) NSString* gender;



//- (BOOL)validateGender:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;






@end

@interface _Author (CoreDataGeneratedAccessors)

@end

@interface _Author (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveGender;
- (void)setPrimitiveGender:(NSString*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




@end
