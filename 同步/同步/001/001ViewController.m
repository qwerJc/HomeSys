//
//  001ViewController.m
//  同步
//
//  Created by 贾辰 on 2018/9/5.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "001ViewController.h"
#import "ModelLoactor.h"
#import "FallsViewController.h"

@interface _01ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSArray *arrList;
@end

@implementation _01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    // Do any additional setup after loading the view.
    _arrList = [NSArray arrayWithObjects:@"瀑布流",@"3D环绕", nil];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(5, 64+5, SCREEN_WIDTH,SCREEN_HEIGHT - 100)];
    tableview.dataSource = self;
    tableview.delegate = self;
//    tableview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:tableview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_arrList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"001CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        [cell.textLabel setText:_arrList[indexPath.row]];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"%@",_arrList[indexPath.row]);
            FallsViewController *vc = [[FallsViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
            NSLog(@"%@",_arrList[indexPath.row]);
            break;
        default:
            break;
    }
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
