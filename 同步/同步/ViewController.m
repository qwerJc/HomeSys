//
//  ViewController.m
//  同步
//
//  Created by 贾辰 on 18/7/8.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import "VideoCallRoomSpeakingAnimationView.h"
#import "temModel.h"
#import "SonViewController.h"
#import "Son2ViewController.h"

#define VoiceCallRoomAnchorRight 5||1

@interface ViewController ()<tryDelegate>
@property (strong, nonatomic) UIImageView *imgvBird2;

@property (strong, nonatomic) SonViewController *sonVC1;
@property (strong, nonatomic) Son2ViewController *son2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 50)];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 setTitle:@"Son1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(onBtn1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 100, 50)];
    [btn2 setBackgroundColor:[UIColor blueColor]];
    [btn2 setTitle:@"Son2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(onBtn2Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(150, 300, 100, 50)];
    [btn3 setBackgroundColor:[UIColor greenColor]];
    [btn3 setTitle:@"Clear" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(onBtn3Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /////////////////////////////////////////////////////////////////////
    NSString *str1 = @"23";
    NSString *str2 = @"3";
    if (str1>str2) {
        NSLog(@"str1 > str2");
    }else if (str1<str2){
        NSLog(@"str1 < str2");
    }else {
        NSLog(@"str1 == str2");
    }
//    [self judge];
    
//    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
//    for (int i = 0; i<100; i++) {
//        int value = arc4random() % 543;
//        [arr addObject:[NSString stringWithFormat:@"%d",value]];
//    }
//
//    [self jcInsert:arr];
//    NSLog(@"%@",arr);
//    NSLog(@"end");
    
    UIView *view = [[UIView alloc] init];
    [view setFrame:CGRectMake(0, 64, 100, 100)];
    view.layer.anchorPoint = CGPointZero;
    [view setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:view];
}

- (void)onBtn1Action{
    if (!_sonVC1) {
        _sonVC1 = [[SonViewController alloc] init];

    }
    [self.navigationController pushViewController:_sonVC1 animated:YES];
}

- (void)onBtn2Action {
    Son2ViewController *son2 = [[Son2ViewController alloc] init];

    _sonVC1.delegate = son2;
    [self.navigationController pushViewController:son2 animated:NO];

    [self.navigationController pushViewController:_sonVC1 animated:YES];
    
    /////****************************************************************************
    
//    if (!_son2) {
//        _son2 = [[Son2ViewController alloc] init];
//        _sonVC1.delegate = _son2;
//    }
//
//    [self.navigationController pushViewController:_sonVC1 animated:YES];
}

- (void)onBtn3Action {
    _son2 = nil;
}

- (void)judge{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i<100; i++) {
        int value = arc4random() % 543;
        [arr addObject:[NSString stringWithFormat:@"%d",value]];
    }
    
    NSLog(@"****************【start】****************");
    [self jcInsert2:arr];
    NSLog(@"****************【end】****************");
    
    for (int i = 1;i<[arr count];i++) {
        if(arr[i] < arr[i-1]){
            NSLog(@"Error!!!!!");
            return;
        }else{
            NSLog(@"%@%@",arr[i],arr[i-1]);
            NSLog(@"%d",([arr[i] intValue] - [arr[i-1] intValue]));
        }
    }
    NSLog(@"Success : ==================================");
    NSLog(@"%@",arr);
}

- (void)jcInsert:(NSMutableArray *)array{
    for (int i = 1; i < [array count]; i++) {
        for (int j = 0; j < [array count]; j++) {
            if (array[i] <= array[j]) {
                [array insertObject:array[i] atIndex:j];
                [array removeObjectAtIndex:i+1];
            }
        }
    }
}

// offical
- (void)jcInsert2:(NSMutableArray *)array{
    for (int i = 1; i< array.count; i++) {
        id get = array[i];
        int j = i-1;
        while (j>=0 && array[j]>get) {
            array[j+1] = array[j];
            j = j - 1;
        }
        array[j+1] = get;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger )getMaxValue:(NSArray <NSString *>*)arr{
    NSInteger max = [[arr firstObject] integerValue];
    for (NSString *item in arr) {
        if (max > [item integerValue]) {
            max = [item integerValue];
        }
    }
    return max;
}
- (void)sayTemString {
    NSLog(@"这是父View实现了代理");
}

@end
