//
//  ViewController.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/7/25.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import "ModelLocator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0,(SCREEN_HEIGHT - floor(SCREEN_WIDTH/9*16) )/2,SCREEN_WIDTH,floor(SCREEN_WIDTH/9*16))];
    [imgv setImage:[UIImage imageNamed:@"2(1).jpg"]];
    imgv.contentMode = UIViewContentModeScaleAspectFit;
    [imgv setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:imgv];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
