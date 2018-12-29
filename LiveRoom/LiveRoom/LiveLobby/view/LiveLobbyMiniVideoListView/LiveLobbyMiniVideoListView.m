//
//  LiveLobbyMiniVideoListView.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/28.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "LiveLobbyMiniVideoListView.h"
#import "HttpEngine+LiveLobby.h"
#import "LiveLobbyMiniVideoListData.h"
#import "LiveLobbyMiniVideoListViewCell.h"

static const CGFloat LiveLobbyMiniVideoListMarginLeft = 7.f;
static const CGFloat LiveLobbyMiniVideoListMarginTop = 0.f;

@interface LiveLobbyMiniVideoListView() <UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) NSMutableArray *arrData;
@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation LiveLobbyMiniVideoListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createData];
        [self createUI];
    }
    return self;
}

- (void)createData {
    _arrData = [NSMutableArray arrayWithCapacity:0];
}

- (void)createUI {
    self.backgroundColor = [UIColor orangeColor];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 7.f;
    layout.minimumInteritemSpacing = 7.f;
    layout.itemSize = CGSizeMake(kCellWidth, kCellHeight);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(LiveLobbyMiniVideoListMarginLeft,
                                                                         LiveLobbyMiniVideoListMarginTop,
                                                                         CGRectGetWidth(self.frame) - LiveLobbyMiniVideoListMarginLeft*2,
                                                                         CGRectGetHeight(self.frame) - LiveLobbyMiniVideoListMarginTop*2)
                                         collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[LiveLobbyMiniVideoListViewCell class] forCellWithReuseIdentifier:@"LiveLobbyMiniVideoListCell"];
    [self addSubview:_collectionView];
}

- (void)setup {
    [[HttpEngine shareEngine] miniVideo_requestListDataWithType:@"recommend"
                                                            uid:nil
                                                           page:@"1"
                                                       pageSize:nil
                                                        lastVid:nil
                                              onCompletionBlock:^(BOOL isSuccess, NSDictionary *content) {
                                                  if (isSuccess) {

                                                      [self.arrData setArray:[self getArrData:content]];
                                                      NSLog(@"data :%@",self.arrData);
                                                  }
                                              } onErrorBlock:^(NSError *error) {
                                                  NSLog(@"%@", error);
                                              }];
}

- (NSArray<LiveLobbyMiniVideoListData *> *)getArrData:(NSDictionary *)content {
    NSMutableArray<LiveLobbyMiniVideoListData *> *arrData = [NSMutableArray arrayWithCapacity:0];
    
    for (id obj in [content objectForKey:@"list"] ) {
        LiveLobbyMiniVideoListData *data = [[LiveLobbyMiniVideoListData alloc] initWithDic:obj];
        if (data) {
            [arrData addObject:data];
        }
    }
    return [arrData copy];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([_arrData count] > 0) {
        return [_arrData count];
    } else {
        return 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveLobbyMiniVideoListViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LiveLobbyMiniVideoListCell"
                                                                                     forIndexPath:indexPath];
    
}
@end
