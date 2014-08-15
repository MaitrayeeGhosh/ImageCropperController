//
//  ViewController.m
//  ImageCropper
//
//  Created by Maitrayee Ghosh on 14/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapCropImageBtn:(id)sender {
    ImageCropController *controller=[[ImageCropController alloc]init];
    controller.cropImage=self.mainImageView.image;
    controller.delegate=self;
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:controller];
    [self presentViewController:navigationController animated:YES completion:nil];
    
}

#pragma mark - ImageCropController Delegate

-(void)didFinishCropping:(UIImage *)croppedImage
{
    self.mainImageView.image=croppedImage;
}

@end
