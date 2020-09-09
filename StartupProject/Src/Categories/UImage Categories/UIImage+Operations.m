//
//  UIImage+Operations.m
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/20/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "UIImage+Operations.h"

@implementation UIImage (Operations)

+ (UIImage*) kgs_imageWithName:(NSString*)name inBundle:(NSBundle*) bundle{
    
    UIImage *img = [UIImage imageNamed:name
                              inBundle: bundle compatibleWithTraitCollection:nil];
    return img;
}

- (UIImage *) kgs_resizeImageWithSize:(CGSize)newSize {
 
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *) kgs_scaleAndRotate{
    
    CGSize size = self.size;
    int kMaxResolution = (size.width > size.height) ? size.width : size.height ;
    
    CGImageRef imgRef = self.CGImage;
    
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    if (width > kMaxResolution || height > kMaxResolution) {
        CGFloat ratio = width/height;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = bounds.size.width / ratio;
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = bounds.size.height * ratio;
        }
    }
    
    CGFloat scaleRatio = bounds.size.width / width;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = self.imageOrientation;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}

- (BOOL) kgs_isBlackImage{
    
    CGImageRef imageRef = self.CGImage;
    size_t width = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    GLubyte * imageData = malloc(width * height * 4);
    int bytesPerPixel = 4;
    int bytesPerRow = (int)(bytesPerPixel * width);
    int bitsPerComponent = 8;
    CGContextRef imageContext =
    CGBitmapContextCreate(
                          imageData, width, height, bitsPerComponent, bytesPerRow, CGImageGetColorSpace(imageRef),
                          kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big
                          );
    
    CGContextSetBlendMode(imageContext, kCGBlendModeCopy);
    CGContextDrawImage(imageContext, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(imageContext);
    
    int byteIndex = 0;
    
    BOOL boolIsBlack = YES;
    for ( ; byteIndex < width*height*4; byteIndex += 4) {
        CGFloat red = ((GLubyte *)imageData)[byteIndex]/255.0f;
        CGFloat green = ((GLubyte *)imageData)[byteIndex + 1]/255.0f;
        CGFloat blue = ((GLubyte *)imageData)[byteIndex + 2]/255.0f;
        CGFloat alpha = ((GLubyte *)imageData)[byteIndex + 3]/255.0f;
        if( (red > 0.5 || green > 0.5 || blue > 0.5 || red + green + blue >= 1.5 ) && alpha > 0.75){
            
            
            NSLog(@"R:%f G:%f B:%f alpha:%f",red,green,blue,alpha);
            
            
            boolIsBlack = NO;
            break;
        }
    }
    
    return boolIsBlack;
}

-(UIImage*) kgs_flipImageTopToBottomOfImage{
    
    UIImageOrientation oriResult = self.imageOrientation;
    
    //Normal
    if(oriResult == UIImageOrientationUp) {
        
        oriResult = UIImageOrientationDownMirrored;
        
    }
    else if(oriResult == UIImageOrientationDownMirrored) {
        
        oriResult = UIImageOrientationUp;
        
    }
    else if(oriResult == UIImageOrientationUpMirrored) {
        
        oriResult = UIImageOrientationDown;
    }
    else if(oriResult == UIImageOrientationDown) {
        
        oriResult = UIImageOrientationUpMirrored;
        
    }
    
    //Mirror
    if(oriResult == UIImageOrientationLeftMirrored) {
        
        oriResult = UIImageOrientationLeft;
        
    }
    else if(oriResult == UIImageOrientationLeft) {
        
        oriResult = UIImageOrientationLeftMirrored;
        
    }
    
    else if(oriResult == UIImageOrientationRight) {
        
        oriResult = UIImageOrientationRightMirrored;
        
    }
    else if(oriResult == UIImageOrientationRightMirrored) {
        
        oriResult = UIImageOrientationRight;
        
    }
    
    
    return  [UIImage imageWithCGImage: self.CGImage
                    
                                       scale: self.scale
                    
                                 orientation: oriResult];
    
}

-(UIImage*) kgs_flipImageLeftToRightOfImage {
    
    
    UIImageOrientation oriResult = self.imageOrientation;
    
    //Normal
    if(oriResult == UIImageOrientationUp) {
        
        oriResult = UIImageOrientationUpMirrored;
        
    }
    else if(oriResult == UIImageOrientationUpMirrored) {
        
        oriResult = UIImageOrientationUp;
        
    }
    else if(oriResult == UIImageOrientationDown) {
        
        oriResult = UIImageOrientationDownMirrored;
    }
    else if(oriResult == UIImageOrientationDownMirrored) {
        
        oriResult = UIImageOrientationDown;
        
    }
    
    //Mirror
    if(oriResult == UIImageOrientationLeftMirrored) {
        
        oriResult = UIImageOrientationRight;
        
    }
    else if(oriResult == UIImageOrientationRight) {
        
        oriResult = UIImageOrientationLeftMirrored;
        
    }
    
    else if(oriResult == UIImageOrientationLeft) {
        
        oriResult = UIImageOrientationRightMirrored;
        
    }
    else if(oriResult == UIImageOrientationRightMirrored) {
        
        oriResult = UIImageOrientationLeft;
        
    }
    
    
    return [UIImage imageWithCGImage: self.CGImage
                    
                                       scale: self.scale
                    
                                 orientation: oriResult];
    
}

-(UIImage*) kgs_rotateImageClockWiseOfImage {
    
    UIImageOrientation oriResult = self.imageOrientation;
    
    //Normal
    if(oriResult == UIImageOrientationUp) {
        
        oriResult = UIImageOrientationRight;
        
    }
    else if(oriResult == UIImageOrientationRight) {
        
        oriResult = UIImageOrientationDown;
        
    }
    else if(oriResult == UIImageOrientationDown) {
        
        oriResult = UIImageOrientationLeft;
    }
    else if(oriResult == UIImageOrientationLeft) {
        
        oriResult = UIImageOrientationUp;
        
    }
    
    //Mirror
    if(oriResult == UIImageOrientationUpMirrored) {
        
        oriResult = UIImageOrientationRightMirrored;
        
    }
    else if(oriResult == UIImageOrientationRightMirrored) {
        
        oriResult = UIImageOrientationDownMirrored;
        
    }
    
    else if(oriResult == UIImageOrientationDownMirrored) {
        
        oriResult = UIImageOrientationLeftMirrored;
        
    }
    else if(oriResult == UIImageOrientationLeftMirrored) {
        
        oriResult = UIImageOrientationUpMirrored;
        
    }
    
    
    return  [UIImage imageWithCGImage: self.CGImage
                     
                                        scale: self.scale
                     
                                  orientation: oriResult];
    
}


@end
