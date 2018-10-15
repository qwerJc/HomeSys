//
//  ViewController004.m
//  同步
//
//  Created by 贾辰 on 2018/9/25.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController004.h"
#import "ModelLoactor.h"

@interface ViewController004 ()<UITextFieldDelegate>
@property (strong, nonatomic) UITextField* txfInput;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@end

@implementation ViewController004

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    [self createUI];
}

- (void)createUI {
    _txfInput = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, SCREEN_WIDTH - 200, 30)];
    _txfInput.backgroundColor = [UIColor lightGrayColor];
    _txfInput.textAlignment = NSTextAlignmentCenter;
    _txfInput.keyboardType = UIKeyboardTypeNumberPad;
    _txfInput.font = [UIFont systemFontOfSize:14.0];
    _txfInput.delegate = self;
    [self.view addSubview:_txfInput];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, SCREEN_WIDTH - 200, 50)];
    [btn setTitle:@"点我变色" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(onBtnHighLight:) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(onBtnNormal:) forControlEvents:UIControlEventTouchDragExit|UIControlEventTouchDragOutside];

    [self.view addSubview:btn];
    
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = btn.bounds;
    _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint = CGPointMake(1, 1);
    [_gradientLayer setCornerRadius:20.0];
    [btn.layer addSublayer:_gradientLayer];
}

#pragma mark - Btn Delegate
- (void)onBtnClick:(UIButton *)btn {
    NSLog(@"点击按钮！");
    
    _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 1);
//    [btn.layer addSublayer:gradientLayer];
    
//    [btn setTitle:@"点我变色" forState:UIControlStateNormal];
//    [btn.layer setCornerRadius:30];
}

- (void)onBtnHighLight:(UIButton *)btn {
    _gradientLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 1);
//    [btn.layer addSublayer:gradientLayer];
    
    [btn setTitle:@"点我变色" forState:UIControlStateNormal];
    [btn.layer setCornerRadius:30];
}

- (void)onBtnNormal:(UIButton *)btn {
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = btn.bounds;
    _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 1);
//    [btn.layer addSublayer:gradientLayer];
    
    [btn setTitle:@"点我变色" forState:UIControlStateNormal];
    [btn.layer setCornerRadius:30];
}
#pragma mark - Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([textField.text isEqualToString:@"0"]) {
        if ([string isEqualToString:@"0"]) {
            return NO;
        }else{
            _txfInput.text = @"";
            return YES;
        }
    }else{
        return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
