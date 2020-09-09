//
//  LocalyticsEvents.h
//  VIDEO EDITOR
//
//  Created by redoan on 7/28/15.
//  Copyright (c) 2015 KITE GAMES STUDIO. All rights reserved.
//


//
#ifdef DEBUG
	//#define LOCALYTICS_ID @"398ad330a0db0393d6130d8-1b99a00e-8554-11e6-d3d5-00dba685b405"			//Test Localytics ID - Old
	#define LOCALYTICS_ID @"c92a7bbbc40871e9e601ba5-66cfbe66-bd06-11e6-b2bc-0098ae15fcaa"			//Test Localytics ID - New
#else
	#define LOCALYTICS_ID @"bb020cfe26f25e73ef15981-d82df4a8-7fc3-11e6-c24c-008d99911bee"  			//Original Localytics ID
#endif

//----- Facebook

//Facebook Original App ID: 542241599312018 	[URL Scheme - fb542241599312018]
//
//Facebook Test App ID: 625994920918390 [URL Scheme - fb625994920918390]

//-----


// --------------------- Main View Controller ---------------------


#define APP_LAUNCH_EVENT                        @"App Launched"

#define APP_LAUNCH_SOURCE                       @"Source"





#define APP_LAUNCH_LAUNCH_NUMBER                @"Launch Number"

#define LC_NEW_PROJECT_STARTED_EVENT            @"New Project Started"

#define LC_NEW_PROJECT_NUMBER_OF_IMAGES         @"Number of Images"

#define LC_NEW_PROJECT_RATIO                    @"Ratio"

#define LC_NEW_PROJECT_LAYOUT                   @"Layout"




#define LC_CLICKED_SAVE_BUTTON_EVENT            @"Save Button Clicked"

#define LC_PHOTO_SAVED_EVENT                    @"Photo Saved"

#define LC_PHOTO_SAVED_NUMBER_OF_IMAGES         @"Number of Images"

#define LC_PHOTO_SAVED_LAYOUT                   @"Layout"

#define LC_PHOTO_SAVED_RATIO                    @"Ratio"

#define LC_PHOTO_SAVED_NUMBER_OF_TEXT_LABELS    @"Number of Text Labels"

#define LC_PHOTO_SAVED_NUMBER_OF_STICKERS       @"Number of Stickers"

#define LC_PHOTO_SHARED_EVENT                   @"Photo Shared"

#define LC_PHOTO_SHARED_SOCIAL_NETWORK          @"Social Network"

#define LC_SOCIAL_NETWORK_INSTAGRAM             @"Instagram"

#define LC_SOCIAL_NETWORK_FACEBOOK              @"Facebook"

#define LC_SOCIAL_NETWORK_MAIL                  @"Mail"

#define LC_SOCIAL_NETWORK_TWITTER               @"Twitter"

#define LC_ERROR_EVENT                          @"Error"

#define LC_ERROR_TYPE                           @"Error Type"

#define LC_FONT                                 @"Font Used"

#define LC_FONT_NAME                            @"Font Name"

#define LC_STICKER                              @"Sticker Used"

#define LC_STICKER_PACK_NAME                    @"Sticker Name"

#define LC_FILTER                               @"Filter Used"

#define LC_FILTER_NAME                          @"Filter Name"

#define LC_CLICKED_SHARE_TO_EDITING_SCREEN      @"Share To Editing Screen Clicked"

#define LC_CLICKED_SHARE_TO_HOME                @"Share To Home Clicked"

#define LC_CLICKED_EDITING_TO_PICKER            @"Editing to Picker Clicked"

#define LC_CLICKED_MORE_APPS                    @"More Apps Clicked"

#define LC_CLICKED_RATE_US                      @"Rate Us Clicked"

#define LC_CLICKED_CONTACT_US                   @"Contact Us Clicked"

#define LC_CLICKED_LAYOUT_MENU                  @"Layout Menu Clicked"

#define LC_CLICKED_FILTER_MENU                  @"Filter Menu Clicked"

#define LC_CLICKED_BORDER_MENU                  @"Border Menu Clicked"

#define LC_CLICKED_TEXT_MENU                    @"Text Menu Clicked"

#define LC_CLICKED_STICKER_MENU                 @"Sticker Menu Clicked"

#define LC_RATED_USERS_EVENT                    @"Rated Users"

#define LC_SESSION_SUMMARY_EVENT                @"Session Summary"

#define LC_SESSION_SUMMARY_ALBUM_CHANGED        @"Album Changed"

#define LC_SESSION_SUMMARY_CLICKED_SELECTED_TAB @"Selected Tab Clicked"

#define LC_SESSION_SUMMARY_LARGE_PREVIEW_USED   @"Large Preview Used"

#define LC_SESSION_SUMMARY_LAYOUT_RESIZED       @"Layout Resized"

#define LC_SESSION_SUMMARY_PHOTO_REPLACED       @"Photo Replaced"

#define LC_SESSION_SUMMARY_PAN_AND_ZOOM_USED    @"Pan and Zoom Used"

#define LC_SESSION_SUMMARY_BORDER_CHANGED       @"Border Changed"

#define LC_SESSION_SUMMARY_TEXT_FONT_CHANGED    @"Text Font Changed"

#define LC_SESSION_SUMMARY_HSBC_USED                @"HSBC Used"

#define LC_SESSION_SUMMARY_SINGLE_PHOTO_SELECTED    @"Single Photo Selected"

#define LC_SESSION_SUMMARY_PHOTO_SWAP_USED          @"Photo Swap Used"

#define SOURCE                                      @"Source"

#define PRODUCT                                     @"Product"

#define LC_IAP_SHOP_SCREEN_OPENED                   @"IAP Shop Screen Opened"

#define LC_IAP_PURCHASE_STARTED                     @"IAP Purchase Started"

#define LC_IAP_PURCHASE_COMPLETED                   @"IAP Purchase Completed"

#define LC_IAP_FIRST_PURCHASE                       @"IAP First Purchase"

#define LAUNCH_NUMBER                               @"Launch Number"

#define TIME_SPENT                                  @"Time Spent"

#define LC_RESTORE_PURCHASES_CLICKED                @"Restore Purchases Clicked"

#define LC_RESTORE_PURCHASES_COMPLETE               @"Restore Purchases Complete"

#define LC_CUSTOM_DIMENSION                         @"Custom Dimension"

#define LC_PURCHASE_STATUS                          @"Purchase Status"  //(Paid | Not Paid)

#define LC_RATE_STATUE                              @"Rate Status"  //(Rated | Not Rated)



#define LC_PHOTO_SHARED                             @"Photo Shared"   //(Shared | Not Shared)

#define SHOP_SOURCE_VIEWCONTROLLER                  @"Picker Screen"

#define SHOP_SOURCE_LAYOUT                          @"Creative Layout"

#define SHOP_SOURCE_FILTER                          @"Filter"

#define SHOP_SOURCE_FONT                            @"Font"

#define SHOP_SOURCE_STICKER                         @"Sticker"

#define SHOP_SOURCE_DEEPLINK                          @"Deeplink"

#define TIME_SPENT_LIFETIME                         @"Time Spent in Seconds"

#define LIFETIME_IMAGE_SAVED                        @"Total photos saved Lifetime"

#define LIFETIME_IMAGES_SHARED                      @"Total photo Shared Lifetime"

#define SEARCH_AD_ATTRIBUTION_EVENT                 @"Search ads attribution event"





#define LC_PHOTO_SELECTED                           @"Photo Selected"

#define LC_ALBUM_CHANGED                            @"Album Changed"

#define LC_SELECTED_TAB                             @"Selected Tab"

#define LC_CAMERA_USED                              @"Camera Used"

#define LC_LAYOUT_SELECTED                          @"Layout Selected"

#define LC_RESIZE_VIDEO_WATCHED                     @"Resize Video Watched"

#define LC_TOTAL_PHOTO_SAVED                        @"Total Photo Saved"  //(0 Photo | 1 Photo | 2 Photos | 3 Photos | Multiple Photos)

#define TOTAL_PHOTO_SAVED                           @"Total Photo Saved"

#define TOTAL_PHOTO_SAVED_CATEGORY                  @"Category"

#define TOTAL_PHOTO_SAVED_TOTAL                     @"Total"
//
#ifdef DEBUG
#define AMPLITUDE_ID @"8ed8a4a66b3f9f9bdfe461951e569f82"  //Test AMPLITUDE_ID
#else
#define AMPLITUDE_ID @""  //Original AMPLITUDE_ID
#endif
