//
//  VoiceCallRoomView.m
//  语音房
//
//  Created by 贾辰 on 2018/7/2.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "VoiceCallRoomView.h"
#import "VoiceCallRoomSeatCell.h"
#import "ModelLocater.h"

static NSString * const VideoCallRoomSeatCellIdentifier = @"VideoCallRoomSeatCellIdentifier";

@interface VoiceCallRoomView()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation VoiceCallRoomView

-(instancetype)initWithFrame:(CGRect)frame{
    frame.origin.x = kVideoCallRoomViewMarginLeft;
    frame.origin.y = 120;
    frame.size.width = SCREEN_WIDTH - kVideoCallRoomViewMarginLeft*2;
    frame.size.height = kVideoCallRoomCellHeight*2 + kVideoCallRoomCellLineSpacing;
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.backgroundColor = [UIColor grayColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = kVideoCallRoomCellLineSpacing;
    flowLayout.minimumInteritemSpacing = (SCREEN_WIDTH - kVideoCallRoomViewMarginLeft*2 - kVideoCallRoomCellWidth *4)/3;
    flowLayout.itemSize = CGSizeMake(kVideoCallRoomCellWidth, kVideoCallRoomCellHeight);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[VoiceCallRoomSeatCell class] forCellWithReuseIdentifier:VideoCallRoomSeatCellIdentifier];
    //    [self.collectionView registerClass:[LiveLobbyCollectionContainerCell class] forCellWithReuseIdentifier:LiveLobbyCollectionContainerCellIdentifier];
    [self addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VoiceCallRoomSeatCell *seatCell = [collectionView dequeueReusableCellWithReuseIdentifier:VideoCallRoomSeatCellIdentifier forIndexPath:indexPath];
    //    seatCell.anchorModel = nil;

    return seatCell;
}
////两个cell之间的间距（同一行的cell的间距）
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 36.f;
//}
//
////这个是两行cell之间的间距（上下行cell的间距）
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 15.f;
//}
@end
