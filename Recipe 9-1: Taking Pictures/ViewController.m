//
//  ViewController.m
//  Recipe 9-1: Taking Pictures
//
//  Created by joseph hoffman on 8/21/13.
//  Copyright (c) 2013 NSCookbook. All rights reserved.
//

#import "ViewController.h"
#import "line.h"

@interface ViewController ()
{
    line *lt;

}

@end

@implementation ViewController

float angle;

@synthesize spacen,samplen, unitn, pickbt;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    lt = [[line alloc]init];
    [lt initline];
   
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions


/*
- (IBAction)takePicture:(id)sender {
    // Make sure camera is available
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Camera Unavailable"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    if (self.imagePicker == nil)
    {
        self.imagePicker = [[UIImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.allowsEditing = YES;
    }
    [self presentViewController:self.imagePicker animated:YES completion:NULL];
}

#pragma mark - delegate methods

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImageWriteToSavedPhotosAlbum (image, nil, nil , nil);
    self.imageView.image = image;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
*/
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [lt touchesBegan:touches withEvent:event];
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [lt touchesMoved:touches withEvent:event ];
   
    self.samplen.text = [lt getdistance];
    self.spacen.text = [lt getspace];
    [self.view addSubview:lt];
}


- (IBAction)unitn:(UITextField *)sender
{
   
    lt.unittext = sender.text;
}

// show album
-(IBAction)pickbt:(id)sender
{
    UIImagePickerController *up = [[UIImagePickerController alloc]init];
    up.delegate = self;
    up.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:up animated:YES completion:NULL];
    
    
   
   
    
}

   
 //choose image
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
    self.imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, Nil, nil, nil);
}

- (IBAction)camera:(UIButton *)sender
{
    UIImagePickerController *ca = [[UIImagePickerController alloc]init];
    ca.delegate = self;
    ca.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:ca animated:YES completion:nil];
}


- (IBAction)turn:(UIButton *)sende
{
    angle = (angle + 3.14159 /4);
    if (angle > 6.3) {angle = 0;}
   
    _imageView.center = CGPointMake(160, 240);
    
    _imageView.transform = CGAffineTransformMakeRotation(angle);
}
@end
