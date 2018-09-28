//
//  ViewController005.m
//  同步
//
//  Created by 贾辰 on 2018/9/28.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController005.h"
#import "ModelLoactor.h"

@interface ViewController005 ()
@property (strong, nonatomic) UITextField* txfInput;
@property (strong, nonatomic) UILabel *lable1;
@end

@implementation ViewController005

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.txfInput = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, SCREEN_WIDTH - 180, 30)];
    _txfInput.backgroundColor = [UIColor lightGrayColor];
    _txfInput.textAlignment = NSTextAlignmentCenter;
    _txfInput.keyboardType = UIKeyboardTypeDefault;
    _txfInput.font = [UIFont systemFontOfSize:13.0];
    [self.view addSubview:_txfInput];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.txfInput.frame) + 10, 100, 60, 30)];
    [btn setBackgroundColor:[UIColor greenColor]];
    [btn addTarget:self action:@selector(onBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 140, 60, 30)];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 addTarget:self action:@selector(onBtnAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(80, 140, 60, 30)];
    [btn2 setBackgroundColor:[UIColor greenColor]];
    [btn2 addTarget:self action:@selector(onBtnAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(150, 140, 60, 30)];
    [btn3 setBackgroundColor:[UIColor greenColor]];
    [btn3 addTarget:self action:@selector(onBtnAction3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(220, 140, 60, 30)];
    [btn4 setBackgroundColor:[UIColor greenColor]];
    [btn4 addTarget:self action:@selector(onBtnAction4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    UIView *viewBG = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 105, 200, 210, 200)];
    [viewBG setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:viewBG];
    
//    self.lable1 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 105, 200, 210, 0)];
    self.lable1 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 105, 200, 210, 0)];
    [self.lable1 setBackgroundColor:[UIColor orangeColor]];
    self.lable1.numberOfLines = 2;
    self.lable1.font = [UIFont systemFontOfSize:13.0];
    self.lable1.lineBreakMode = NSLineBreakByCharWrapping;
//    self.lable1.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.view addSubview:self.lable1];
}

- (void)onBtnAction {
    self.lable1.text = self.txfInput.text;
    [self.lable1 setFrame:CGRectMake(SCREEN_WIDTH/2 - 105, 200, 210, 0)];
    [self.lable1 sizeToFit];
}

- (void)onBtnAction1 {
    self.lable1.text = @"如果有一天我们两个吵架了很严重，你会怎么办?";
    [self.lable1 setFrame:CGRectMake(SCREEN_WIDTH/2 - 105, 200, 210, 0)];
    [self.lable1 sizeToFit];
    
    CGRect labelFrame = self.lable1.frame;
    labelFrame.size.width = 210;
    self.lable1.frame = labelFrame;
}

- (void)onBtnAction2 {
    self.lable1.text = @"两个吵架了很严重，你会怎怎么办办";
    [self.lable1 setFrame:CGRectMake(SCREEN_WIDTH/2 - 105, 200, 210, 0)];
    [self.lable1 sizeToFit];
}

- (void)onBtnAction3 {
    self.lable1.text = @"两个吵架了很严重，你会怎怎么办";
    [self.lable1 setFrame:CGRectMake(SCREEN_WIDTH/2 - 105, 200, 210, 0)];
    [self.lable1 sizeToFit];
}

- (void)onBtnAction4 {
    self.lable1.text = @"如果有一天我们两个吵架了很严重，你会怎么办?如果有一天我们两个吵架了很严重，你会怎么办?";
    [self.lable1 setFrame:CGRectMake(SCREEN_WIDTH/2 - 105, 200, 210, 0)];
    [self.lable1 sizeToFit];
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
