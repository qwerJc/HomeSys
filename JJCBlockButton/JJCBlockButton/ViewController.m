//
//  ViewController.m
//  JJCBlockButton
//
//  Created by 贾辰 on 2018/9/26.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import "JJCBlockBtn.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JJCBlockBtn *btn = [[JJCBlockBtn alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, 100, 200, 45)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn addClickActionBlock:^{
        NSLog(@"点击了 JJC 按钮");
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
