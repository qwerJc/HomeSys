//
//  CollectionViewItem.m
//  同步
//
//  Created by 贾辰 on 2018/9/5.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "CollectionViewItem.h"

@interface CollectionViewItem()

@property (strong, nonatomic) UILabel *indexNum;
@property (strong, nonatomic) UILabel *txvDetailInfo;

@end

@implementation CollectionViewItem
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}


- (void)createUI{
    CGFloat cellWidth = self.frame.size.width;
    CGFloat cellHeight = self.frame.size.height;
    
    _indexNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, cellWidth, 20)];
    _indexNum.textAlignment = NSTextAlignmentCenter;
    _indexNum.textColor = [UIColor whiteColor];
    [self addSubview:_indexNum];
    
    _txvDetailInfo = [[UILabel alloc] initWithFrame:CGRectMake(0, cellHeight-50, cellWidth, 40)];
    _txvDetailInfo.textAlignment = NSTextAlignmentCenter;
    _txvDetailInfo.textColor = [UIColor whiteColor];
    [self addSubview:_txvDetailInfo];
}

- (void)setTitle:(NSString *)title andID:(NSString *)number{
    _indexNum.text = [NSString stringWithFormat:@"【%@】",number];
    
    _txvDetailInfo.text = title;
}
@end
