//
//  LoginInformationViewController.m
//  GripBall
//
//  Created by 贾辰 on 2018/3/7.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "LoginInformationViewController.h"
#import "ModelLocator.h"

@interface LoginInformationViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong , nonatomic) UIPickerView *pickerSexView;
@property (strong , nonatomic) UIPickerView *pickerDateView;
@end

@implementation LoginInformationViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
       
        
        [self createUI];
        
    }
    return self;
}

-(void)createUI
{
    self.navigationItem.title = @"Login";
    
    UIImageView *imgvBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [imgvBG setImage:[UIImage imageNamed:@"connect_background"]];
    [self.view addSubview:imgvBG];
    
    UIImageView *imgVIcon = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-65, 100, 130, 130)];
    [imgVIcon setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:imgVIcon];
    
    UIButton *btnBack = [[UIButton alloc] initWithFrame:CGRectMake(45.f, 62.f, 40.f, 40.f)];
    [btnBack setBackgroundImage:[UIImage imageNamed:@"practice_btn1"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(clickBtnBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 43.f,70.f, 86.f, 25.f)];
    [lblTitle setText:@"完善信息"];
    [lblTitle setTextColor:[UIColor colorWithRed:217.f/255.f green:217.f/255.f blue:217.f/255.f alpha:1]];
    [lblTitle setFont:[UIFont fontWithName:@"ArialMT" size:20.f]];
    [lblTitle setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:lblTitle];
    
    UIButton *btnFinish = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-45.f-40.f, 62.f, 40.f, 40.f)];
    [btnFinish setBackgroundImage:[UIImage imageNamed:@"practice_btn1"] forState:UIControlStateNormal];
    [btnFinish addTarget:self action:@selector(clickBtnFinish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnFinish];
    
    self.pickerSexView = [[UIPickerView alloc]initWithFrame:CGRectMake(100, 300, 200, 70)];
    [self.pickerSexView setBackgroundColor:[UIColor whiteColor]];
    self.pickerSexView.delegate = self;
    self.pickerSexView.dataSource = self;
    [self.view addSubview:self.pickerSexView];
    
    self.pickerDateView = [[UIPickerView alloc]initWithFrame:CGRectMake(100, 400, 300, 170)];
    [self.pickerDateView setBackgroundColor:[UIColor whiteColor]];
    self.pickerDateView.delegate = self;
    self.pickerDateView.dataSource = self;
    [self.view addSubview:self.pickerDateView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = touches.anyObject;//获取触摸对象
    NSLog(@"%@",@(touch.tapCount));//短时间内的点击次数
}

#pragma mark - picker Delegate
//返回有几列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if(pickerView == self.pickerSexView){
        return 1;
    }else{
        return 3;
    }
    
}
//返回指定列的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.pickerSexView) {
        return 2;
    }else if (pickerView == self.pickerDateView){
        if (component == 0) {
            return 20;
        }else if(component == 1){
            return 12;
        }else if (component == 2){
            return 30;
        }else{
            return 1;
        }
    }else{
        return 1;
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"Select！");
}

////返回picker的组数
//-(NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
//    if(pickerView != self.pickerSexView){
//        return 10;
//    }else{
//        return ;
//    }
//}

//返回指定列，行的高度，就是自定义行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 25.0f;
}
// 自定义指定列的每行的视图，即指定列的每行的视图行为一致
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    if (!view){
        view = [[UIView alloc]init];
    }
    
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/3, 20)];
    text.textAlignment = NSTextAlignmentCenter;
    text.text = @"男";
    [view addSubview:text];
    //隐藏上下直线
    //    [self.pickerView.subviews objectAtIndex:1].backgroundColor = [UIColor clearColor];
    //    [self.pickerView.subviews objectAtIndex:2].backgroundColor = [UIColor clearColor];
    
    return view;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
