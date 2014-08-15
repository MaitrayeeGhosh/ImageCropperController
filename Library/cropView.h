//
//  cropView.h
//  ImageCropper
//
//  Created by Maitrayee Ghosh on 14/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cropView : UIView
{
    UIView *cropArea;
    CGFloat kResizeThumbSize;
    BOOL isResizingLR;
    BOOL isResizingUL;
    BOOL isResizingUR;
    BOOL isResizingLL;
    CGPoint touchStart;
}

-(UIImage *)getCroppedImage;
@property (strong,nonatomic) IBOutlet UIImageView *cropImageView;

@end
