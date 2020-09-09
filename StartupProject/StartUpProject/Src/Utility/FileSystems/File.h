//
//  File.h
//  Photo-Collage
//
//  Created by Towhidul Islam on 9/8/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface File : NSObject
- (instancetype) initWithUrl:(NSURL*)url;
- (NSURL *) URL;
- (NSData*) read;

/**
 *
 */
- (BOOL) writeFrom:(File*)readFile bufferSize:(NSUInteger)size;

/**
 *
 */
- (BOOL) writeFrom:(NSData*)data;

/**
 *
 */
- (BOOL)excludeFromBackup:(BOOL)shouldExclude;

/**
 *
 */
- (BOOL)exist;

/**
 *
 */
- (BOOL)deleteFile;
@end
