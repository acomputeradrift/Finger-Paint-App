//
//  FingerView.m
//  Finger Paint App
//
//  Created by Jamie on 2018-08-10.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "FingerView.h"
#import "Data Model.h"
#import "Segment.h"



@interface FingerView ()

@property (nonatomic) NSMutableArray *lines;


@end


@implementation FingerView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _lines = [NSMutableArray new];
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    // First line segment is from the initial touch point to the initial touch point, so
    // basically a point
    Data_Model *dataModel = [[Data_Model alloc] initWithFirstPoint:first secondPoint:first];
    
    Segment *segment = [[Segment alloc] init];
    [segment.dataModelArray addObject:dataModel];
    segment.color  = self.strokeColor;
    [self.lines addObject:segment];
    
    // Tell the system that we need to be redrawn, so the system will call drawRect: before
    // the end of the current event loop
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint second = [touch locationInView:self];        // Current touch location
    CGPoint first = [touch previousLocationInView:self]; // Previous touch location
    //NSLog(@"%d: %@, %@", __LINE__, NSStringFromCGPoint(first), NSStringFromCGPoint(second));
    // Line segment is from previous touch location to current touch location
    Data_Model *dataModel = [[Data_Model alloc] initWithFirstPoint:first
                                                       secondPoint:second];
    //Segment *segment = [[Segment alloc] init];
    Segment *segment = [self.lines lastObject];
    [segment.dataModelArray addObject:dataModel];
   // [self.lines addObject:dataModel];
    
    // Tell the system that we need to be redrawn, so the system will call drawRect: before
    // the end of the current event loop
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    
    for (Segment *segment in self.lines) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 5.0;
        path.lineCapStyle = kCGLineCapRound;
        [segment.color setStroke];
        
        // Loop through all elements in the segment array and draw each line
        for (Data_Model *dataModel in segment.dataModelArray) {
            if (CGPointEqualToPoint(dataModel.firstPoint, dataModel.secondPoint)) {
                // If start/end point of line segment is the same (i.e. this is the first
                // point, then move to that point so that line is drawn starting from that
                // point
                [path moveToPoint:dataModel.firstPoint];
                continue;
            }
            // Draw a line from the previous line segment to the first point
            [path addLineToPoint:dataModel.firstPoint];
            // Draw a line from the first point to the second point
            [path addLineToPoint:dataModel.secondPoint];
        }
        [path stroke];
    }
}






- (void)clear
{
    [self.lines removeAllObjects];
    [self setNeedsDisplay];
}

@end
