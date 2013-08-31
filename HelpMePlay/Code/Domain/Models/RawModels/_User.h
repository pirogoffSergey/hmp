// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>


extern const struct UserAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *token;
	__unsafe_unretained NSString *uid;
	__unsafe_unretained NSString *userpic;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *playlists;
} UserRelationships;

extern const struct UserFetchedProperties {
} UserFetchedProperties;

@class Playlist;




@class UIImage;

@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (UserID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* token;



//- (BOOL)validateToken:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* uid;



@property int32_t uidValue;
- (int32_t)uidValue;
- (void)setUidValue:(int32_t)value_;

//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) UIImage* userpic;



//- (BOOL)validateUserpic:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *playlists;

- (NSMutableSet*)playlistsSet;





@end

@interface _User (CoreDataGeneratedAccessors)

- (void)addPlaylists:(NSSet*)value_;
- (void)removePlaylists:(NSSet*)value_;
- (void)addPlaylistsObject:(Playlist*)value_;
- (void)removePlaylistsObject:(Playlist*)value_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveToken;
- (void)setPrimitiveToken:(NSString*)value;




- (NSNumber*)primitiveUid;
- (void)setPrimitiveUid:(NSNumber*)value;

- (int32_t)primitiveUidValue;
- (void)setPrimitiveUidValue:(int32_t)value_;




- (UIImage*)primitiveUserpic;
- (void)setPrimitiveUserpic:(UIImage*)value;





- (NSMutableSet*)primitivePlaylists;
- (void)setPrimitivePlaylists:(NSMutableSet*)value;


@end
