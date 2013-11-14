//
//  FirstViewController.h
//  IpadImageShuffle
//
//  Created by Vikash Soni on 13/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIGestureRecognizerDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSArray *_imageArray;
}

-(IBAction)shuffleAction:(id)sender;
-(IBAction)rearrangeAction:(id)sender;
-(IBAction)slideShowAction:(UIButton *)sender;
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnShuffle;
@property (weak, nonatomic) IBOutlet UIButton *btnRearrange;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *imgageViewTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewThree;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFour;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFive;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnShowSlideShow;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewSix;





@end
