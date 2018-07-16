//
//  ViewController.m
//  同步
//
//  Created by 贾辰 on 18/7/8.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import "VideoCallRoomSpeakingAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    VideoCallRoomSpeakingAnimationView *amView = [[VideoCallRoomSpeakingAnimationView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [amView setLayerWidth:120];
    [amView setLayerWidth:80];
    [amView setLayerColor:[UIColor redColor]];
    [amView startAnimation];
    [self.view addSubview:amView];
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    [btn1 setBackgroundColor:[UIColor redColor]];
    [btn1 addTarget:self action:@selector(onBtn1) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setAlpha:0.1];
    [self.view addSubview:btn1];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setValue:@"qwerew" forKey:@"1"];
    [dic setValue:@"zzzzzz" forKey:@"2"];
    
    NSLog(@"%@",dic);
    [dic setValue:@"ccc111" forKey:@"1"];
    NSLog(@"%@",dic);
}
-(void)onBtn1{
    NSLog(@"weqr");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
