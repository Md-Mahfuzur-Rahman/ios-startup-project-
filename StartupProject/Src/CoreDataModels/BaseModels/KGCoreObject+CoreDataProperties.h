//
//  KGCoreObject+CoreDataProperties.h
//  StartUpProject
//
//  Created by Towhidul Islam on 12/22/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import <CoreDataStack/CoreDataStack.h>

NS_ASSUME_NONNULL_BEGIN

@interface KGCoreObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *guid;

@end

NS_ASSUME_NONNULL_END
