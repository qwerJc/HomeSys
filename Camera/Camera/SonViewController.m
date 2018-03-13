//
//  SonViewController.m
//  Camera
//
//  Created by 贾辰 on 2018/3/13.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "SonViewController.h"
#import "ModelLocator.h"

@interface SonViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.f alpha:0.2]];
//    [self.view setAlpha:0.4];
    
    UIView *viewBG = [[UIView alloc] initWithFrame:CGRectMake(50, 50, SCREEN_WIDTH -100, SCREEN_HEIGHT-100)];
    [viewBG setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:viewBG];
    // Do any additional setup after loading the view.
    
    UIView *viewNowUserBG = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewBG.frame.size.width, 100)];
    [viewNowUserBG setBackgroundColor:[UIColor blueColor]];
    [viewBG addSubview:viewNowUserBG];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0,100,viewBG.frame.size.width,viewBG.frame.size.height-200) style:UITableViewStyleGrouped];
    tableview.dataSource=self;
    tableview.delegate = self;
    [viewBG addSubview:tableview];
}

-(void)onBtnBack{
    NSLog(@"qqqqq");
}

#pragma mark - tableView
//添加编辑模式
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//左滑动出现的文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

//删除所做的动作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Deleate!");
}
//Height of Cell
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
//Num of Cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   //每个节点有几行
    return 20;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle   reuseIdentifier:CIdentifier];
    }
    cell.detailTextLabel.text=@"qqqq";
    return cell;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
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
