//
//  File.m
//  Photo-Collage
//
//  Created by Towhidul Islam on 9/8/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "File.h"

@interface File ()
@property (nonatomic, strong) NSURL* url;
@end

@implementation File

- (instancetype)initWithUrl:(NSURL *)url{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}

- (NSData *)read{
    return [NSData dataWithContentsOfURL:self.url];
}

- (BOOL)writeFrom:(File *)readFile bufferSize:(NSUInteger)size{
    NSData *data = [readFile read];
    BOOL isSuccess = [data writeToURL:self.url atomically:YES];
    return isSuccess;
}

- (BOOL)excludeFromBackup:(BOOL)shouldExclude{
    BOOL isSuccess = NO;
    NSError *error;
    [[self url] setResourceValue:[NSNumber numberWithBool:shouldExclude] forKey:NSURLIsExcludedFromBackupKey error:&error];
    if (error == nil) {
        isSuccess = YES;
    }
    return isSuccess;
}

- (NSURL *)URL{
    return _url;
}

- (BOOL)exist{
    return [[NSFileManager defaultManager] fileExistsAtPath:self.url.path];
}

- (BOOL)writeFrom:(NSData *)data{
    BOOL isSuccess = [data writeToURL:self.url atomically:YES];
    return isSuccess;
}

- (BOOL)deleteFile{
    if ([self exist]) {
        NSError *error;
        BOOL isDeleted = [[NSFileManager defaultManager] removeItemAtURL:self.url error:&error];
        if (error) {
            NSLog(@"%@",[error debugDescription]);
        }
        return isDeleted;
    }
    return NO;
}

@end
