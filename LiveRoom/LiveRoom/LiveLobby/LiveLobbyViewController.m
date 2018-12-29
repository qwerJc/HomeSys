//
//  LiveLobbyViewController.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/27.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "LiveLobbyViewController.h"
#import "ModelLocator.h"
#import "LiveLobbyMainScrollView.h"

@interface LiveLobbyViewController ()
@property (strong, nonatomic) LiveLobbyMainScrollView *mainScrollView;
@end

@implementation LiveLobbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)createUI {
    [self createHeadBar];
    [self createBottomBar];
    [self createMainScrollView];
}

- (void)createHeadBar {
    UIView *headBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    headBar.backgroundColor = [UIColor redColor];
    [self.view addSubview:headBar];
}

- (void)createBottomBar {
    UIView *bottomBar = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
    bottomBar.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bottomBar];
}

- (void)createMainScrollView {
    _mainScrollView = [[LiveLobbyMainScrollView alloc] init];
    [self.view addSubview:_mainScrollView];
}

@end
