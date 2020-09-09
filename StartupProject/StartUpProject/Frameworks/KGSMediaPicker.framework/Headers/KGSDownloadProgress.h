//
//  KGSDownloadProgress.h
//  AddMusicToVideo_V2
//
//  Created by KITE GAMES STUDIO on 9/6/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CERoundProgressView.h"

@protocol KGSDownloadProgressDelegate <NSObject>

-(void) cancelDownload;

@end

@interface KGSDownloadProgress : UIView

@property (nonatomic, assign) id<KGSDownloadProgressDelegate>customDelegate;
@property (weak, nonatomic) IBOutlet UILabel *lblDownloadProgress;
@property (weak, nonatomic) IBOutlet CERoundProgressView *viewDownloadProgress;
@property (weak, nonatomic) IBOutlet UILabel *lblCompletionCount;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

@property (weak, nonatomic) IBOutlet UILabel *lblHeader1;
@property (weak, nonatomic) IBOutlet UILabel *lblHeader2;
- (IBAction)btnDownloadCancelPressed:(id)sender;

-(void) updateCompletionCount:(NSInteger)iCompletionCount totalCount: (NSInteger)iTotalCount;

-(void)showCancelBtn;
@end
