//
//  ViewController003.m
//  同步
//
//  Created by 贾辰 on 2018/9/6.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController003.h"
#import "ModelLoactor.h"

@interface ViewController003 ()
@property (strong, nonatomic) UITextField *txfInput;
@property (strong, nonatomic) UIButton *btnStart;

@property (strong, nonatomic) UILabel *lblCountdownTimer;

@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) float countdownNum;
@end

@implementation ViewController003

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    [self createUI];
}

- (void)createUI{
    _txfInput = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
    _txfInput.keyboardType = UIKeyboardTypeNumberPad;
    _txfInput.backgroundColor = [UIColor whiteColor];
    _txfInput.font = [UIFont systemFontOfSize:15];
    [_txfInput setPlaceholder:@"输入倒计时秒数"];
    [self.view addSubview:_txfInput];
    
    _btnStart = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_txfInput.frame)+10, CGRectGetMinY(_txfInput.frame), kMiddleButtonWidth, kMiddleButtonHeight)];
    [_btnStart setBackgroundColor:[UIColor blueColor]];
    [_btnStart setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_btnStart.layer setCornerRadius:10.0];
    _btnStart.layer.masksToBounds = YES;
    [_btnStart setTitle:@"开始" forState:UIControlStateNormal];
    [_btnStart addTarget:self action:@selector(onStartAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnStart];
    
    _lblCountdownTimer = [[UILabel alloc] initWithFrame:CGRectMake(0, 230, SCREEN_WIDTH, 50)];
    [_lblCountdownTimer setBackgroundColor:[UIColor grayColor]];
    [_lblCountdownTimer setFont:[UIFont systemFontOfSize:52]];
    _lblCountdownTimer.text = @"00:00:00.0";
    _lblCountdownTimer.textAlignment = NSTextAlignmentCenter;
//    [_lblCountdownTimer sizeToFit];
    _lblCountdownTimer.center = CGPointMake(SCREEN_WIDTH/2, 250);
    [self.view addSubview:_lblCountdownTimer];
    
}

- (void)onStartAction {
    _countdownNum = [_txfInput.text floatValue];
    
    [self invalidateTimer];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(countdownTimer) userInfo:nil repeats:YES];
    
}

- (void)countdownTimer {
    if (_countdownNum <=0) {
        [self invalidateTimer];
        return;
    }
    
    _countdownNum = _countdownNum - 0.1;
    _lblCountdownTimer.text = [self changeCountdownNumToTime:_countdownNum];
    
}

- (NSString *)changeCountdownNumToTime:(float)countdownNum {
    int hour = 0;
    int minute = 0;
    float second = 0;
    
    // 34521 :09:00:2121
    
    if (countdownNum > 3600) {
        hour = countdownNum / 3600;
        if (hour > 99) {
            hour = 99;
        }
        minute = fmodf(countdownNum, 3600.0) / 60;
        second = fmodf(fmodf(countdownNum, 3600.0), 60.0);
    }else if (countdownNum > 60){
        minute = countdownNum / 60;
        second = fmodf(countdownNum, 60.0);
    }else{
        second = countdownNum;
    }
    
    NSString *stringHour = @"00";
    NSString *stringMin = @"00";
    NSString *stringSec = @"00.0";
    
    if (hour >= 10){
        stringHour = [NSString stringWithFormat:@"%d",hour];
    }else if (hour > 0){
        stringHour = [NSString stringWithFormat:@"0%d",hour];
    }
    if (minute >= 10){
        stringMin = [NSString stringWithFormat:@"%d",minute];
    }else if (minute >0){
        stringMin = [NSString stringWithFormat:@"0%d",minute];
    }
    if (second >= 10){
        stringSec = [NSString stringWithFormat:@"%.1f",second];
    }else if(second > 0){
        stringSec = [NSString stringWithFormat:@"0%.1f",second];
    }
    
    return [NSString stringWithFormat:@"%@:%@:%@",stringHour,stringMin,stringSec];
}

- (void)invalidateTimer {
    if (_timer && [_timer isValid]) {
        [_timer invalidate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
