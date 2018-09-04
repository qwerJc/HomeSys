//
//  SonViewController.m
//  同步
//
//  Created by 贾辰 on 2018/8/30.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "SonViewController.h"

@interface SonViewController ()

@end

@implementation SonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [btn1 setTitle:@"ShowLog" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(Log) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn1];
}

- (void)Log {
    [self.delegate sayTemString];
    
//    if ([self.delegate respondsToSelector:@selector(sayTemString)]) {
//        [self.delegate sayTemString];
//    }else{
//        NSLog(@"没有实现代理方法");
//    }
}

- (void)dealloc {
    NSLog(@"Son1 Dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
