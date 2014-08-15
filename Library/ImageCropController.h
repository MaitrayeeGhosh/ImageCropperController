//
//  ImageCropController.h
//  ImageCropper
//
//  Created by Maitrayee Ghosh on 14/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cropView.h"

@protocol imageCroppingControllerDelegate <NSObject>
-(void)didFinishCropping:(UIImage *)croppedImage;
@end

@interface ImageCropController : UIViewController
{
    cropView *crop;
}

@property(nonatomic,assign)id<imageCroppingControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImage *cropImage;
@end
