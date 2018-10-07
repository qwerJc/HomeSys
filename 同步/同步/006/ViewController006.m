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
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 60, 100, 40)];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 addTarget:self action:@selector(onBtn1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 300) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 100)];
    _headerView.backgroundColor = [UIColor orangeColor];
    
    UIView *bound = [[UIView alloc] initWithFrame:CGRectMake(1, 1, SCREEN_WIDTH-2, 98)];
    bound.backgroundColor = [UIColor redColor];
    [_headerView addSubview:bound];
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
