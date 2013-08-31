//
//  HPDatabase.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPDatabase.h"
#import "HPDataBaseHelper.h"
#import "HPEntityDeletingObjective.h"


@implementation HPDatabase

+ (User *)currentUser
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[User entityName]];
    NSArray *fetchResults = [[HPDataBaseHelper sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    if(!fetchResults.count) {
        return nil; //no current user
    }
    else if(fetchResults.count == 1) {
        return [fetchResults lastObject];
    }
    else {
        [NSException raise:@"HPDatabaseException" format:@"more than 1 user in database exist"];
        return nil;
    }
}

+ (void)restoreCurrentUser
{
    HPEntityDeletingObjective *entityDeleter = [HPEntityDeletingObjective new];
    User *user = [HPDatabase currentUser];
    if(user) {
        entityDeleter.entity = user;
        [entityDeleter reach];
    }
}



+ (NSArray *)songs
{
    return nil;
}

//+ (NSArray *)vendors
//{
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Vendor entityName]];
//    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:VendorAttributes.name ascending:YES]];
//    
//    return [[QRDataBaseHelper sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
//}
//
//+ (NSArray *)modelsForVendor:(NSString *)vendorName
//{
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Model entityName]];
//    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"vendor != nil && vendor.name == %@", vendorName];
//    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ModelAttributes.name ascending:YES]];
//    
//    return [[QRDataBaseHelper sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
//}

@end
