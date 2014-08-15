//
//  ViewController.h
//  ImageCropper
//
//  Created by Maitrayee Ghosh on 14/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCropController.h"


@interface ViewController : UIViewController<imageCroppingControllerDelegate>

- (IBAction)didTapCropImageBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@end
