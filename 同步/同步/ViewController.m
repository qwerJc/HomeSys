//
//  ViewController.m
//  同步
//
//  Created by 贾辰 on 18/7/8.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import "VideoCallRoomSpeakingAnimationView.h"
#import "tem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    VideoCallRoomSpeakingAnimationView *amView = [[VideoCallRoomSpeakingAnimationView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    [amView setLayerWidth:160];
    [amView setLayerColor:[UIColor redColor]];
    [amView startAnimation];
    [self.view addSubview:amView];
    
    tem *view1 = [[tem alloc] initWithFrame:CGRectMake(200, 300, 100, 100)];
    [self.view addSubview:view1];
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
