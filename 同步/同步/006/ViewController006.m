//
//  ViewController006.m
//  同步
//
//  Created by 贾辰 on 2018/10/4.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController006.h"
#import "ModelLoactor.h"

@interface ViewController006 ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UITableView *tableview;
@end

@implementation ViewController006

- (void)onBtn1Action {
    [_headerView setFrame:CGRectMake(0, 0,SCREEN_WIDTH, 200)];
    [_tableview reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSAttributedString *strTitle = [[NSAttributedString alloc] initWithString:@"真心话大冒险连麦"
                                                                   attributes:@{
                                                                                NSForegroundColorAttributeName : [UIColor blackColor],
                                                                                NSFontAttributeName : [UIFont systemFontOfSize:10],
                                                                                NSParagraphStyleAttributeName: paragraphStyle,
                                                                                }];
    
    NSAttributedString *strPrice = [[NSAttributedString alloc] initWithString:@"\n1000六币/局"
                                                                   attributes:@{
                                                                                NSForegroundColorAttributeName : [UIColor colorWithRed:255.f green:240.f blue:0.f alpha:1],
                                                                                NSFontAttributeName : [UIFont boldSystemFontOfSize:10],
                                                                                NSParagraphStyleAttributeName: paragraphStyle,
                                                                                }];
    
    NSMutableAttributedString *message = [[NSMutableAttributedString alloc] initWithAttributedString:strTitle];
    [message appendAttributedString:strPrice];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 60, 100, 80)];
//    [btn1 setTitle:@"真心话大冒险连麦\n1000六币/局" forState:UIControlStateNormal];
    btn1.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 addTarget:self action:@selector(onBtn1Action) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setAttributedTitle:message forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    
//    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100,
//                                                                100,
//                                                                (SCREEN_WIDTH - 40 )/2 ,
//                                                                50)];
//    [btn1.layer setCornerRadius:20.0];
//    [btn1 setBackgroundColor:[UIColor redColor]];
//    [btn1 addTarget:self action:@selector(onApplyGameCallAction) forControlEvents:UIControlEventTouchUpInside];
//    [btn1 addTarget:self action:@selector(onBtnApplyGameHighlighted) forControlEvents:UIControlEventTouchDown];
//    [btn1 addTarget:self action:@selector(onBtnApplyGameNormal) forControlEvents:UIControlEventTouchUpOutside|UIControlEventTouchDragOutside];
//    [btn1 setAttributedTitle:message forState:UIControlStateNormal];
//    [self.view addSubview:btn1];
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 300) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 100)];
    _headerView.backgroundColor = [UIColor orangeColor];
    
    UIView *bound = [[UIView alloc] initWithFrame:CGRectMake(1, 1, SCREEN_WIDTH-2, 98)];
    bound.backgroundColor = [UIColor redColor];
    [_headerView addSubview:bound];
    
    
    UIView *viewTry = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    [viewTry setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:viewTry];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    [lblTitle setFont:[UIFont systemFontOfSize:12.0]];
//    [lblTitle setTextAlignment:NSTextAlignmentLeft];
    [lblTitle setText:@"送甜蜜棒棒糖跳舞"];
    [viewTry addSubview:lblTitle];
    
    NSLog(@"lblTitle width:%f /n height:%f",lblTitle.frame.size.width,lblTitle.frame.size.height);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return _headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGRectGetHeight(_headerView.frame);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ssss"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ssss"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
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
