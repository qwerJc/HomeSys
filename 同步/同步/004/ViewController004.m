//
//  ViewController004.m
//  同步
//
//  Created by 贾辰 on 2018/9/25.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController004.h"
#import "ModelLoactor.h"
#import "RoomCallListCellButton.h"

@interface ViewController004 ()<UITextFieldDelegate>
@property (strong, nonatomic) UITextField* txfInput;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) RoomCallListCellButton *btnNew;
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
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, SCREEN_WIDTH - 200, 50)];
    [_btn setTitle:@"点我变色" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_btn addTarget:self action:@selector(onBtnHighLight:) forControlEvents:UIControlEventTouchDown];
    [_btn addTarget:self action:@selector(onBtnNormal:) forControlEvents:UIControlEventTouchDragExit|UIControlEventTouchDragOutside];
    [self.view addSubview:_btn];
    
    UIButton *btnChange = [[UIButton alloc] initWithFrame:CGRectMake(250, 200, 60, 30)];
    [btnChange setBackgroundColor:[UIColor redColor]];
    [btnChange addTarget:self action:@selector(onBtnChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnChange];
    
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = _btn.bounds;
    _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint = CGPointMake(1, 1);
    [_gradientLayer setCornerRadius:20.0];
    [_btn.layer addSublayer:_gradientLayer];
    
    UIView *viewNewBtnBG = [[UIView alloc] initWithFrame:CGRectMake(50, 250, 200, 200)];
    [viewNewBtnBG setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:viewNewBtnBG];
    
    UIView *viewRuler = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 5)];
    [viewRuler setBackgroundColor:[UIColor greenColor]];
    [viewNewBtnBG addSubview:viewRuler];
    
    _btnNew = [[RoomCallListCellButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [_btnNew setHitSize:CGSizeMake(160, 160)];
    [_btnNew setBackgroundColor:[UIColor orangeColor]];
    [_btnNew addTarget:self action:@selector(onBtnNew) forControlEvents:UIControlEventTouchUpInside];
    [viewNewBtnBG addSubview:_btnNew];
}

- (void)onBtnNew {
    NSLog(@"Click!!");
}
#pragma mark - Btn Delegate
- (void)onBtnChange {
    _btn.layer.sublayers = nil;
    [_btn setBackgroundColor:[UIColor redColor]];
}

- (void)onBtnClick:(UIButton *)btn {
    NSLog(@"点击按钮！");
    if (_btn.layer.sublayers) {
        _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
    }else {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = _btn.bounds;
        _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 1);
        [_gradientLayer setCornerRadius:20.0];
        [_btn.layer addSublayer:_gradientLayer];
    }
    
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 1);
//    [btn.layer addSublayer:gradientLayer];
    
//    [btn setTitle:@"点我变色" forState:UIControlStateNormal];
//    [btn.layer setCornerRadius:30];
}

- (void)onBtnHighLight:(UIButton *)btn {
    if (_btn.layer.sublayers) {
        _gradientLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    }else {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = _btn.bounds;
        _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 1);
        [_gradientLayer setCornerRadius:20.0];
        [_btn.layer addSublayer:_gradientLayer];
    }
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 1);
//    [btn.layer addSublayer:gradientLayer];
    
}

- (void)onBtnNormal:(UIButton *)btn {
    if (_btn.layer.sublayers) {
        _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
    }else {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = _btn.bounds;
        _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 1);
        [_gradientLayer setCornerRadius:20.0];
        [_btn.layer addSublayer:_gradientLayer];
    }

    _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 1);
//    [btn.layer addSublayer:gradientLayer];

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
