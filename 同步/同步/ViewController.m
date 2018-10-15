//
//  ViewController.m
//  同步
//
//  Created by 贾辰 on 18/7/8.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewItem.h"

#import "001ViewController.h"
#import "ViewController003.h"
#import "ViewController004.h"
#import "ViewController005.h"
#import "ViewController006.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *arrData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.arrData = @[@"CollectionView",@"TableView",@"倒计时",@"仿支付宝 输入框 \n渐变按钮",@"自适应高度label",@"tableView Header"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //创建一个layout布局类
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个item的大小为100*100
    layout.itemSize = CGSizeMake(100, 100);

    layout.minimumInteritemSpacing = 10;
    
    //创建collectionView 通过一个布局策略layout来创建
    UICollectionView * collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64.f, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:layout];
    collect.backgroundColor = [UIColor grayColor];
    //代理设置
    collect.delegate=self;
    collect.dataSource=self;
    //注册item类型 这里使用系统的类型
    [collect registerClass:[CollectionViewItem class] forCellWithReuseIdentifier:@"MainViewItem"];
    
    [self.view addSubview:collect];
}

//返回每个item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //    6.0后使用如下的方法直接从注册的cell类获取创建，如果没有注册 会崩溃

    CollectionViewItem *seatCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainViewItem" forIndexPath:indexPath];
    seatCell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    if (indexPath.row < _arrData.count) {
        [seatCell setTitle:_arrData[indexPath.row] andID:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    }
    
    return seatCell;
}

//返回分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    ViewController003 *vc = [[ViewController003 alloc] init];
    
    switch (indexPath.row) {
        case 0:{
            _01ViewController *vc = [[_01ViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 2:{
            ViewController003 *vc = [[ViewController003 alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            ViewController004 *vc = [[ViewController004 alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:{
            ViewController005 *vc = [[ViewController005 alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5:{
            ViewController006 *vc = [[ViewController006 alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }

        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
