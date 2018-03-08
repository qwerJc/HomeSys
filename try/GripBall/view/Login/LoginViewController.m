//
//  LoginViewController.m
//  GripBall
//
//  Created by 贾辰 on 2017/9/25.
//  Copyright © 2017年 贾辰. All rights reserved.
//

#import "LoginViewController.h"
#import "ModelLocator.h"
#import "MainViewController.h"
#import "LoginInformationViewController.h"

@interface LoginViewController ()
@property (strong ,nonatomic) UITextView *txvTel;
@property (strong ,nonatomic) UITextView *txvPwd;

@property (strong, nonatomic) UIButton *btnSignIn;//登陆
@property (strong, nonatomic) UIButton *btnSignUP;//注册
@property (strong, nonatomic) MainViewController *viewControllerBlueTooth;
@property (strong, nonatomic) LoginInformationViewController *viewControllerLoginInformation;
@end

@implementation LoginViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewControllerBlueTooth = [[MainViewController alloc] init];
        self.viewControllerLoginInformation = [[LoginInformationViewController alloc] init];
        
        [self createUI];
        
    }
    return self;
}

-(void)createUI
{
    self.navigationItem.title = @"Login";
    
    UIImageView *imgVIcon = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-65, 100, 130, 130)];
    [imgVIcon setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:imgVIcon];
    
    UIImageView *imgVBGInput = [[UIImageView alloc] initWithFrame:CGRectMake(40, 270,SCREEN_WIDTH-80, SCREEN_HEIGHT-400)];
    [imgVBGInput setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:imgVBGInput];
    
    UIImageView *imgVTelIcon = [[UIImageView alloc] initWithFrame:CGRectMake(70, 320, 20, 20)];
    [imgVTelIcon setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:imgVTelIcon];
    
    self.txvTel = [[UITextView alloc] initWithFrame:CGRectMake(120, 310,SCREEN_WIDTH-200, 30)];
    [self.txvTel setSelectable:NO];
    [self.view addSubview:self.txvTel];
    
    UIImageView *imgVPwdIcon = [[UIImageView alloc] initWithFrame:CGRectMake(70, 400, 20, 20)];
    [imgVPwdIcon setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:imgVPwdIcon];
    
    self.txvTel = [[UITextView alloc] initWithFrame:CGRectMake(120, 390,SCREEN_WIDTH-200, 30)];
    [self.txvTel setSelectable:NO];
    [self.view addSubview:self.txvTel];
    

    self.btnSignIn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-85.5f, SCREEN_HEIGHT-200.f, 171, 46.f)];
    [self.btnSignIn setBackgroundImage:[UIImage imageNamed:@"connect_btn_blue"] forState:UIControlStateNormal];
    [self.btnSignIn addTarget:self
                      action:@selector(onClickedSignIn)
            forControlEvents:UIControlEventTouchUpInside];
    [self.btnSignIn setTitle:@"登陆" forState:UIControlStateNormal];
    [self.btnSignIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [self.btnSignIn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.btnSignIn];
    
    self.btnSignUP = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-85.5f, SCREEN_HEIGHT-80.f, 171, 46.f)];
    [self.btnSignUP setBackgroundImage:[UIImage imageNamed:@"connect_btn_blue"] forState:UIControlStateNormal];
    [self.btnSignUP addTarget:self
                       action:@selector(onClickedSignUP)
             forControlEvents:UIControlEventTouchUpInside];
    [self.btnSignUP setTitle:@"注册" forState:UIControlStateNormal];
    [self.btnSignUP setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [self.btnSignUP setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.btnSignUP];
    

    
}

#pragma mark - btnEvent
-(void)onClickedSignIn
{
    [self.navigationController pushViewController:self.viewControllerBlueTooth animated:YES];
}
-(void)onClickedSignUP{
    [self.navigationController pushViewController:self.viewControllerLoginInformation animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
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
