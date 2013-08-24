// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Playlist.h instead.

#import <CoreData/CoreData.h>


extern const struct PlaylistAttributes {
	__unsafe_unretained NSString *cover;
	__unsafe_unretained NSString *name;
} PlaylistAttributes;

extern const struct PlaylistRelationships {
	__unsafe_unretained NSString *songs;
} PlaylistRelationships;

extern const struct PlaylistFetchedProperties {
} PlaylistFetchedProperties;

@class Record;

@class UIImage;


@interface PlaylistID : NSManagedObjectID {}
@end

@interface _Playlist : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PlaylistID*)objectID;





@property (nonatomic, strong) UIImage* cover;



//- (BOOL)validateCover:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *songs;

- (NSMutableSet*)songsSet;





@end

@interface _Playlist (CoreDataGeneratedAccessors)

- (void)addSongs:(NSSet*)value_;
- (void)removeSongs:(NSSet*)value_;
- (void)addSongsObject:(Record*)value_;
- (void)removeSongsObject:(Record*)value_;

@end

@interface _Playlist (CoreDataGeneratedPrimitiveAccessors)


- (UIImage*)primitiveCover;
- (void)setPrimitiveCover:(UIImage*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveSongs;
- (void)setPrimitiveSongs:(NSMutableSet*)value;


@end
