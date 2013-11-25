//
//  PopOverViewController.h
//  IpadImageShuffle
//
//  Created by Vikash Soni on 13/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

@interface PopOverViewController : UIViewController<UIPopoverControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
