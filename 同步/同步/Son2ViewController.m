//
//  Son2ViewController.m
//  同步
//
//  Created by 贾辰 on 2018/8/30.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "Son2ViewController.h"
#import "SonViewController.h"

@interface Son2ViewController ()<tryDelegate>

@end

@implementation Son2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Delagate
- (void)sayTemString{
    NSLog(@"这是Son2 实现了代理");
}

- (void)dealloc {
    NSLog(@"Son2 Dealloc");
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
