//
//  ViewController.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/7/25.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import "ModelLocator.h"
#import "AppDelegate+JJC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 84, 160, 64)];
    [btn1 setBackgroundColor:[UIColor orangeColor]];
    [btn1 setTitle:@"进入看直播房间" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(onBtn1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
}

#pragma mark - Btn Action
- (void)onBtn1Action {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATIONS_ROOM_WILL_SETUP object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
