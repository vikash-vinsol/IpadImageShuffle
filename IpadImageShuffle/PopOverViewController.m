//
//  PopOverViewController.m
//  IpadImageShuffle
//
//  Created by Vikash Soni on 13/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "PopOverViewController.h"
#import "SingleTonArray.h"
#import "CanvasViewController.h"

@interface PopOverViewController ()

{
    NSTimer *timer;
    int currentImage;
    NSArray *_imageArray;
}

@end

@implementation PopOverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
   self.imgView.image = [UIImage imageNamed:[_imageArray objectAtIndex:currentImage]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [SingleTonArray theSingle];
    _imageArray = [[SingleTonArray theSingle]sharedArray];
    timer = [NSTimer scheduledTimerWithTimeInterval: 3.0
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo: nil
                                            repeats: YES];
}

- (void) handleTimer: (NSTimer *) timer
{
    if (currentImage >= _imageArray.count-1)
    {
        currentImage = -1;
    }
    currentImage ++;
    //Create an animation with pulsating effect
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:0.5];
    theAnimation.duration=0.5;
    theAnimation.autoreverses=YES;
    [self performSelector:@selector(holdImage) withObject:Nil afterDelay:0.5];
    [_imgView.layer addAnimation:theAnimation forKey:@"animateOpacity"];
    
    NSLog(@"%d",currentImage);
}
-(void)holdImage
{
    _imgView.image =  [UIImage imageNamed:[_imageArray objectAtIndex:currentImage]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidDisappear:(BOOL)animated
{
    [timer invalidate];
    timer = nil;
}

@end
