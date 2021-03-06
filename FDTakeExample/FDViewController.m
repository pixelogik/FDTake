//
//  FDViewController.m
//  FDTakeExample
//
//  Created by Will Entriken on 8/9/12.
//  Copyright (c) 2012 William Entriken. All rights reserved.
//

#import "FDViewController.h"

@interface FDViewController () <FDTakeDelegate>

@end

@implementation FDViewController
@synthesize imageView;

- (IBAction)takePhotoOrChooseFromLibrary
{
    [self.takeController takePhotoOrChooseFromLibrary];
}

- (IBAction)takeVideoOrChooseFromLibrary
{
    [self.takeController takeVideoOrChooseFromLibrary];
}

- (IBAction)takePhotoOrVideoOrChooseFromLibrary
{
    [self.takeController takePhotoOrVideoOrChooseFromLibrary];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.takeController = [[FDTakeController alloc] init];
    self.takeController.delegate = self;
}

- (IBAction)editingSwitchToggled:(id)sender
{
    self.takeController.imagePicker.allowsEditing = [(UISwitch *)sender isOn];
}


#pragma mark - FDTakeDelegate

- (void)takeController:(FDTakeController *)controller didCancelAfterAttempting:(BOOL)madeAttempt
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Example app" message:@"The take was cancelled" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)takeController:(FDTakeController *)controller gotPhoto:(UIImage *)photo withInfo:(NSDictionary *)info
{
    [self.imageView setImage:photo];
}


- (void)viewDidUnload {
    [self setImageView:nil];
    [super viewDidUnload];
}
@end
