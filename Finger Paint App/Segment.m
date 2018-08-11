//
//  Segment.m
//  Finger Paint App
//
//  Created by Jamie on 2018-08-11.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "Segment.h"

@implementation Segment
- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor grayColor];
        _dataModelArray = [[NSMutableArray alloc] init];
        
    }
    return self;
}

@end
