//
//  ViewController.m
//  JXRotateView
//
//  Created by yuezuo on 16/5/9.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "ViewController.h"
#import "JXBgView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JXBgView * bgView = [[JXBgView alloc] init];
    bgView.bgCount = 20;
    bgView.bgTime = 4;
    bgView.bgColor = [UIColor orangeColor];
    bgView.frame = CGRectMake(0, 100, 300, 200);
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView];
    
}

@end
