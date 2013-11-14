//
//  SingleTonArray.h
//  IpadImageShuffle
//
//  Created by Vikash Soni on 13/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleTonArray : NSObject

@property (strong,nonatomic) NSArray *singletonArray;
@property (strong,nonatomic) NSMutableArray *sharedArray;

+(SingleTonArray *) theSingle;

@end
