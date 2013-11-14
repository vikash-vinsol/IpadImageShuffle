//
//  SingleTonArray.m
//  IpadImageShuffle
//
//  Created by Vikash Soni on 13/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "SingleTonArray.h"

@implementation SingleTonArray
@synthesize sharedArray,singletonArray;


+(SingleTonArray *) theSingle
{
    static SingleTonArray *theSingle = nil;
    if (!theSingle)
    {
        theSingle = [[super allocWithZone:nil] init];
    }
    return theSingle;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self theSingle];
}

- (id)init
{
    //If sharedInstance is nil, +initialize is our caller, so initialze the instance.
    //If it is not nil, simply return the instance without re-initializing it.
    self = [super init];
    if (self)
    {
        sharedArray = [[NSMutableArray alloc] initWithObjects:@"cute_nature-HD.jpg",@"download (1).jpeg",@"download.jpeg",@"images.jpeg",@"index.jpg",@"six.jpg",nil];
    }
    return self;
}

@end