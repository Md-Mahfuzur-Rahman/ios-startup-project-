//
//  Folder.h
//  Photo-Collage
//
//  Created by Towhidul Islam on 9/8/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "File.h"

@interface Folder : NSObject
- (instancetype) initWithName:(NSString *)name searchDirectoryType:(NSSearchPathDirectory)directory;

/**
 * Path of the directory.
 */
- (NSString*) path;

/**
 * Return any files contains in a Directory by matching with search clause. If search is nil then return all files.
 */
- (NSArray<File*>*) filesSearchBy:(NSString*)search;

/**
 * Folder exist or not
 */
- (BOOL) exist;

/**
 * fileName has to be exect match with the fileName containing in receiver's directory.
 */
- (BOOL) fileExistByName:(NSString*)fileName;

/**
 *
 */
- (void) deleteAllFiles;
@end
