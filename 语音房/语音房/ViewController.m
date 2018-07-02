//
//  ViewController.m
//  语音房
//
//  Created by 贾辰 on 2018/6/29.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import "VoiceCallRoomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    VideoCallListView *listView = [[VideoCallListView alloc] init];
//    [self.view addSubview:listView];
    VoiceCallRoomView *viewVoiceRoom = [[VoiceCallRoomView alloc] init];
    [self.view addSubview:viewVoiceRoom];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
