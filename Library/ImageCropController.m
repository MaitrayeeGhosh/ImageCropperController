//
//  ImageCropController.m
//  ImageCropper
//
//  Created by Maitrayee Ghosh on 14/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import "ImageCropController.h"

@interface ImageCropController ()

@end

@implementation ImageCropController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    [self setNavigationRightBarButton];
    [self setNavigationLeftBarButton];
    [self calculateImageViewHeightForCropImage];
}

- (void)setNavigationRightBarButton
{
    self.navigationItem.hidesBackButton=YES;
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(didTapDoneBtn)];
    self.navigationItem.rightBarButtonItem=doneBtn;
}

- (void)setNavigationLeftBarButton
{
    UIBarButtonItem *cancelBtn=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(didTapBackBtn)];
    self.navigationItem.leftBarButtonItem=cancelBtn;
}

#pragma mark - Done Cropping

-(void)didTapDoneBtn
{
    if([_delegate respondsToSelector:@selector(didFinishCropping:)])
    {
        NSLog(@"enter");
        if([self delegate])
        {
            [[self delegate] didFinishCropping:[crop getCroppedImage]];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didTapBackBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)getSizeOfCropImage:(UIImage *)targetImage
{
    CGSize size=CGSizeMake(targetImage.size.width, targetImage.size.height);
    return size;
}

- (void)calculateImageViewHeightForCropImage
{
    CGSize imageSize = [self getSizeOfCropImage:self.cropImage];
    float imageViewHeight=(320/imageSize.width)*imageSize.height;
    [self setImageViewFrameBasedOnImageSize:imageViewHeight];
}

- (void)setImageViewFrameBasedOnImageSize:(float)height
{
    crop=[[cropView alloc]initWithFrame:CGRectMake(0, 64, 320, height)];
    crop.cropImageView.image=self.cropImage;
    [self.view addSubview:crop];
  
}




@end
