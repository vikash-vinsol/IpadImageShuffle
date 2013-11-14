//
//  FirstViewController.m
//  IpadImageShuffle
//
//  Created by Vikash Soni on 13/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "FirstViewController.h"
#import "PopOverViewController.h"

@interface FirstViewController ()<UIPopoverControllerDelegate>
{
    PopOverViewController *controller;
    UIPopoverController *popoverController;
}

@end

@implementation FirstViewController
{
    CGRect someRect;
    NSMutableArray *array;
}

@synthesize imageViewFive,imageViewFour,imageViewOne,imageViewSix,imageViewThree,imgageViewTwo,btnShowSlideShow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.view setUserInteractionEnabled:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _imageArray = [[NSArray alloc]initWithObjects:imageViewFive,imageViewFour,imageViewOne,imageViewSix,imageViewThree,imgageViewTwo, nil];
    
    int j;
    array = [[NSMutableArray alloc]init];
    for (j=0; j<6; j++)
    {
        UIImageView *imageView = [_imageArray objectAtIndex:j];
        [array addObject:[NSValue valueWithCGRect:imageView.frame]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)slideShowAction:(id)sender
{
    controller = [[PopOverViewController alloc] initWithNibName:@"PopOverViewController" bundle:nil];
    popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];

    if ([popoverController isPopoverVisible])
    {
        [popoverController dismissPopoverAnimated:YES];
    }
    else
    {
        [popoverController presentPopoverFromBarButtonItem:self.btnShowSlideShow permittedArrowDirections:0 animated:YES];
        popoverController.popoverContentSize = CGSizeMake(1020, 1400);
    }
}
-(IBAction)rearrangeAction:(id)sender
{
    int i;
    for (i=0; i<6; i++)
    {
        UIImageView *image =  [_imageArray objectAtIndex:i];
        [UIView animateWithDuration:0.35
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                                        [image setFrame:[[array objectAtIndex:i] CGRectValue]];
                                     }
                         completion:^(BOOL finished)
         {
             Nil;
         }];
    }
}


-(IBAction)shuffleAction:(id)sender
{
    int i;
    for (i=0; i<6; i++)
    {
        UIImageView *image =  [_imageArray objectAtIndex:i];
        [UIView animateWithDuration:0.35
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                                        [image setFrame:CGRectMake((arc4random()%900), (arc4random()%500), 300, 200)];
                                    }
                         completion:^(BOOL finished)
                        {
                            Nil;
                        }];
    }
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor), recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 120), self.view.bounds.size.height);
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
