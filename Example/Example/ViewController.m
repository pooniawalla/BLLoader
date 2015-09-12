//
//  ViewController.m
//  Example
//
//  Created by Poonia on 13/09/15.
//  Copyright (c) 2015 Babulal Poonia. All rights reserved.
//

#import "ViewController.h"
#import "BLLoader.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet BLLoader *loader1;
@property (weak, nonatomic) IBOutlet BLLoader *loader2;
@property (weak, nonatomic) IBOutlet BLLoader *loader3;
@property (weak, nonatomic) IBOutlet BLLoader *loader4;
@property (weak, nonatomic) IBOutlet BLLoader *loader5;
@property (weak, nonatomic) IBOutlet BLLoader *loader6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loader1.lineWidth = 6.0;
    _loader1.color = [UIColor darkGrayColor];
    [_loader1 startAnimation];
    
    // Default
    [_loader2 startAnimation];
    
    _loader3.lineWidth = 12.0;
    _loader3.color = [UIColor brownColor];
    [_loader3 startAnimation];
    
    _loader4.lineWidth = 16.0;
    _loader4.color = [UIColor magentaColor];
    [_loader4 startAnimation];
    
    _loader5.lineWidth = 25.0;
    _loader5.color = [UIColor purpleColor];
    [_loader5 startAnimation];
    
    _loader6.lineWidth = 50.0;
    _loader6.color = [UIColor grayColor];
    [_loader6 startAnimation];
    
}

@end
