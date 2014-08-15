//
//  cropView.m
//  ImageCropper
//
//  Created by Maitrayee Ghosh on 14/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import "cropView.h"

@implementation cropView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        kResizeThumbSize=45.0f;
        self.backgroundColor=[UIColor whiteColor];
        [self setCropImageView];
       
    }
    return self;
}

- (void)setCropImageView
{
    self.cropImageView=[[UIImageView alloc]initWithFrame:self.bounds];
    self.cropImageView.contentMode=UIViewContentModeScaleToFill ;
    [self addSubview:self.cropImageView];
    [self setResizableViewOnCropImageView];
}

- (void)setResizableViewOnCropImageView
{
    cropArea=[[UIView alloc]initWithFrame:CGRectMake(20, 20, 280,self.frame.size.height-40)];
    cropArea.backgroundColor=[UIColor colorWithWhite:0.0 alpha:0.6];
    cropArea.layer.borderColor=[UIColor whiteColor].CGColor;
    cropArea.layer.borderWidth=2.0f;
    cropArea.layer.cornerRadius=8.0f;
    [self addSubview:cropArea];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    touchStart = [[touches anyObject] locationInView:cropArea];
    isResizingLR = (cropArea.bounds.size.width - touchStart.x < kResizeThumbSize && cropArea.bounds.size.height - touchStart.y < kResizeThumbSize);
    isResizingUL = (touchStart.x <kResizeThumbSize && touchStart.y <kResizeThumbSize);
    isResizingUR = (cropArea.bounds.size.width-touchStart.x < kResizeThumbSize && touchStart.y<kResizeThumbSize);
    isResizingLL = (touchStart.x <kResizeThumbSize && cropArea.bounds.size.height -touchStart.y <kResizeThumbSize);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject] locationInView:cropArea];
    CGPoint previous = [[touches anyObject] previousLocationInView:cropArea];
    
    CGFloat deltaWidth = touchPoint.x - previous.x;
    CGFloat deltaHeight = touchPoint.y - previous.y;
    
    CGFloat x = cropArea.frame.origin.x;
    CGFloat y = cropArea.frame.origin.y;
    CGFloat width = cropArea.frame.size.width;
    CGFloat height = cropArea.frame.size.height;
    
    if (isResizingLR) {
        cropArea.frame = CGRectMake(x, y, touchPoint.x+deltaWidth, touchPoint.y+deltaWidth);
        
    } else if (isResizingUL) {
        cropArea.frame = CGRectMake(x+deltaWidth, y+deltaHeight, width-deltaWidth, height-deltaHeight);
        
        
    } else if (isResizingUR) {
        cropArea.frame = CGRectMake(x, y+deltaHeight, width+deltaWidth, height-deltaHeight);
        
    } else if (isResizingLL) {
        cropArea.frame = CGRectMake(x+deltaWidth, y, width-deltaWidth, height+deltaHeight);
        
    } else {
        
        cropArea.center = CGPointMake(cropArea.center.x + touchPoint.x - touchStart.x,
                                  cropArea.center.y + touchPoint.y - touchStart.y);
        
    }
    
}


-(UIImage *)getCroppedImage
{
    float topEdgePosition = CGRectGetMinY(cropArea.frame);
    float sideEdgePosition = CGRectGetMinX(cropArea.frame);
    float height=CGRectGetHeight(cropArea.frame);
    float width=CGRectGetWidth(cropArea.frame);
    float aspectX=(_cropImageView.image.size.width/_cropImageView.frame.size.width)*sideEdgePosition;
    float aspectY=(_cropImageView.image.size.height/_cropImageView.frame.size.height)*topEdgePosition;
    float aspectHeight=(_cropImageView.image.size.height/_cropImageView.frame.size.height)*height;
    float aspectWidth=(_cropImageView.image.size.width/_cropImageView.frame.size.width)*width;
    CGRect clippedRect = CGRectMake(aspectX, aspectY,aspectWidth,aspectHeight);
    CGImageRef imageRef = CGImageCreateWithImageInRect([_cropImageView.image CGImage], clippedRect);
    UIImage * croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
   
}




@end
