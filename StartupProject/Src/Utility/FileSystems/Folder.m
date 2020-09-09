//
//  Folder.m
//  Photo-Collage
//
//  Created by Towhidul Islam on 9/8/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "Folder.h"

@interface Folder ()
@property (nonatomic, strong) NSString *defaultName;
@property (assign) NSSearchPathDirectory searchDirectoryType;
@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) NSURL *folderPathUrl;
@end

@implementation Folder

- (instancetype)initWithName:(NSString *)name searchDirectoryType:(NSSearchPathDirectory)directory{
    if (self = [super init]) {
        self.fileManager = [NSFileManager defaultManager];
        self.defaultName = @"untitled folder";
        if (name && name.length > 0) {
            self.defaultName = name;
        }
        self.searchDirectoryType = directory;
        [self createFolderIfNotExist];
    }
    return self;
}

- (void) createFolderIfNotExist{
    NSString *currentPath = [[self getUserDirectoryPath] stringByAppendingPathComponent:self.defaultName];
    if ([self.fileManager fileExistsAtPath:currentPath] == false) {
        NSError *error;
        if ([self.fileManager createDirectoryAtPath:currentPath withIntermediateDirectories:YES attributes:nil error:&error] == false) {
            NSLog(@"%@ failed to create reason %@",self.defaultName, error.debugDescription);
        }else{
            NSLog(@"createRootDirectoryIfNotExist %@ created",self.defaultName);
        }
    }else{
        NSLog(@"createRootDirectoryIfNotExist %@ already exist",self.defaultName);
    }
    self.folderPathUrl = [[NSURL alloc] initFileURLWithPath:currentPath isDirectory:YES];
}

- (NSString*) getUserDirectoryPath{
    NSArray *urls = [self.fileManager URLsForDirectory:self.searchDirectoryType inDomains:NSUserDomainMask];
    NSString *path = [(NSURL*)[urls lastObject] path];
    return path;
}

- (NSString *)path{
    return self.folderPathUrl.path;
}

- (BOOL)exist{
    return [self.fileManager fileExistsAtPath:self.folderPathUrl.path];
}

- (NSArray<File*>*) filesSearchBy:(NSString *)search{
    NSArray<File*> *documents = [NSArray<File*> new];
    NSError *error;
    NSArray *fileNames = [self.fileManager contentsOfDirectoryAtPath:[self path] error:&error];
    if (search != nil && search.length > 0) {
        NSPredicate *query = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", search];
        NSArray *filtered = [fileNames filteredArrayUsingPredicate:query];
        documents = [self files:filtered];
    }else{
        documents = [self files:fileNames];
    }
    return documents;
}

- (NSArray<File*>*) files:(NSArray*)names{
    NSMutableArray<File*> *filesArray = [NSMutableArray<File*> new];
    for (NSString *name in names) {
        NSString *filePath = [self.path stringByAppendingPathComponent:name];
        File *file = [[File alloc] initWithUrl:[NSURL fileURLWithPath:filePath]];
        [filesArray addObject:file];
    }
    return filesArray;
}

- (void)deleteAllFiles{
    NSArray *files = [self filesSearchBy:nil];
    for (File *file in files) {
        [file deleteFile];
    }
}

- (BOOL) fileExistByName:(NSString*)fileName{
    return [self.fileManager fileExistsAtPath:[self.folderPathUrl.path stringByAppendingPathComponent:fileName]];
}

@end
