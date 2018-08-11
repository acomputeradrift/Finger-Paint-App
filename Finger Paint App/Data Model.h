//
//  Data Model.h
//  Finger Paint App
//
//  Created by Jamie on 2018-08-10.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Data_Model : NSObject

@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint secondPoint;

- (instancetype)initWithFirstPoint:(CGPoint)first
                       secondPoint:(CGPoint)second;

@end
