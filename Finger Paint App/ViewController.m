//
//  ViewController.m
//  Finger Paint App
//
//  Created by Jamie on 2018-08-10.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "ViewController.h"
#import "FingerView.h"
#import "FingerView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet FingerView *fingerView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)setToBlueColorButton:(id)sender {
    NSLog(@"Set to blue");
    self.fingerView.strokeColor = [UIColor blueColor];
    [self.fingerView.strokeColor setStroke];
}
- (IBAction)setToGreenColorButton:(id)sender {
}
- (IBAction)setToOrangeColorButton:(id)sender {
}
- (IBAction)setToYellowColorButton:(id)sender {
}

- (IBAction)setToRedColorButton:(id)sender {
}


- (IBAction)clear:(id)sender {
    [self.fingerView clear];
}

@end
