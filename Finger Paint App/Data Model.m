//
//  Data Model.m
//  Finger Paint App
//
//  Created by Jamie on 2018-08-10.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "Data Model.h"

@implementation Data_Model

- (instancetype)initWithFirstPoint:(CGPoint)first
                       secondPoint:(CGPoint)second
{
    if (self = [super init]) {
        _firstPoint = first;
        _secondPoint = second;
    }
    return self;
}

@end
