// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Record.h instead.

#import <CoreData/CoreData.h>


extern const struct RecordAttributes {
	__unsafe_unretained NSString *accords;
	__unsafe_unretained NSString *cover;
	__unsafe_unretained NSString *lyrics;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
} RecordAttributes;

extern const struct RecordRelationships {
	__unsafe_unretained NSString *composer;
	__unsafe_unretained NSString *genre;
	__unsafe_unretained NSString *relatedMedia;
} RecordRelationships;

extern const struct RecordFetchedProperties {
} RecordFetchedProperties;

@class Composer;
@class Genre;
@class MediaItem;


@class UIImage;




@interface RecordID : NSManagedObjectID {}
@end

@interface _Record : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RecordID*)objectID;





@property (nonatomic, strong) NSString* accords;



//- (BOOL)validateAccords:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) UIImage* cover;



//- (BOOL)validateCover:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lyrics;



//- (BOOL)validateLyrics:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* uid;



@property int32_t uidValue;
- (int32_t)uidValue;
- (void)setUidValue:(int32_t)value_;

//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *composer;

- (NSMutableSet*)composerSet;




@property (nonatomic, strong) Genre *genre;

//- (BOOL)validateGenre:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *relatedMedia;

- (NSMutableSet*)relatedMediaSet;





@end

@interface _Record (CoreDataGeneratedAccessors)

- (void)addComposer:(NSSet*)value_;
- (void)removeComposer:(NSSet*)value_;
- (void)addComposerObject:(Composer*)value_;
- (void)removeComposerObject:(Composer*)value_;

- (void)addRelatedMedia:(NSSet*)value_;
- (void)removeRelatedMedia:(NSSet*)value_;
- (void)addRelatedMediaObject:(MediaItem*)value_;
- (void)removeRelatedMediaObject:(MediaItem*)value_;

@end

@interface _Record (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccords;
- (void)setPrimitiveAccords:(NSString*)value;




- (UIImage*)primitiveCover;
- (void)setPrimitiveCover:(UIImage*)value;




- (NSString*)primitiveLyrics;
- (void)setPrimitiveLyrics:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveUid;
- (void)setPrimitiveUid:(NSNumber*)value;

- (int32_t)primitiveUidValue;
- (void)setPrimitiveUidValue:(int32_t)value_;





- (NSMutableSet*)primitiveComposer;
- (void)setPrimitiveComposer:(NSMutableSet*)value;



- (Genre*)primitiveGenre;
- (void)setPrimitiveGenre:(Genre*)value;



- (NSMutableSet*)primitiveRelatedMedia;
- (void)setPrimitiveRelatedMedia:(NSMutableSet*)value;


@end
