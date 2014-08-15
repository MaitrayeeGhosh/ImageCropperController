ImageCropperController
======================

It is a controller for image cropping. 

Feature:
        Crop an image after selecting the desired crop area.

System Requirements:
                    Need iOS 7.0 or higher.

Usage:
         
        Use the following code to bring the image cropper controller. set the target image that need to be cropped
      
         ImageCropController *controller=[[ImageCropController alloc]init];
    controller.cropImage=self.mainImageView.image;
    controller.delegate=self;
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:controller];
    [self presentViewController:navigationController animated:YES completion:nil];
     
     Call the delegate method to get the cropped image

  -(void)didFinishCropping:(UIImage *)croppedImage
{
     self.mainImageView.image=croppedImage;
}
