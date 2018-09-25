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
