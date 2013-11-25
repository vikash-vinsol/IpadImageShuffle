//
//  FirstViewController.m
//  IpadImageShuffle
//
//  Created by Vikash Soni on 13/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "CanvasViewController.h"
#import "PopOverViewController.h"


#define NUM_Width_Image 245
#define Num_Height_Image 164

@interface CanvasViewController ()<UIPopoverControllerDelegate>

@end

@implementation CanvasViewController
{
    CGRect someRect;
    NSMutableArray *arrayFrame;
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
    [self.mScrollView setScrollEnabled:YES];
    [self.mScrollView setContentSize:CGSizeMake(2048, 768)];
    [self addFrame];
}

-(void)addFrame
{
    _imageArray = [[NSArray alloc]initWithObjects:imageViewFive,imageViewFour,imageViewOne,imageViewSix,imageViewThree,imgageViewTwo, nil];

    int j;
    arrayFrame = [[NSMutableArray alloc]init];
    for (j=0; j<6; j++)
    {
        UIImageView *imageView = [_imageArray objectAtIndex:j];
        [arrayFrame addObject:[NSValue valueWithCGRect:imageView.frame]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)slideShowAction:(id)sender
{

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
                                        [image setFrame:[[arrayFrame objectAtIndex:i] CGRectValue]];
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
                                        [image setFrame:CGRectMake((arc4random()%700), (arc4random()%600), NUM_Width_Image, Num_Height_Image)];
                                    }
                         completion:^(BOOL finished)
                        {
                            Nil;
                        }];
    }
}

-(void) selectPanAction:(NSInteger) xHeight : (NSInteger) xWidth :(NSInteger) yHeight : (NSInteger) yWidth : (UIPanGestureRecognizer *) recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        
        float slideFactor = 0.05 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor), recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, xHeight), self.view.bounds.size.width-xWidth);
        finalPoint.y = MIN(MAX(finalPoint.y, yHeight), self.view.bounds.size.height-yHeight);
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
            
        } completion:nil];
        
    }
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer
{
    [self selectPanAction:NUM_Width_Image/2 :150 :130 :80 :recognizer];
}

- (IBAction)handlePanTwo:(UIPanGestureRecognizer *)recognizer2
{
    [self selectPanAction:1154 :-900 :0 :0 :recognizer2];
}


@end
