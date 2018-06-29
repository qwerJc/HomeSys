//
//  VideoCallListView.m
//  语音房
//
//  Created by 贾辰 on 2018/6/29.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "VideoCallListView.h"
#import "LiveRoomViedoCallListCell.h"
#import "VideoCallListCellData.h"


#import "ModelLocater.h"

/** 底部麦序视图高度 */
static NSInteger const kVideoCallListAudienceViewHeight = 325;

@interface VideoCallListView()<UITableViewDataSource, UITableViewDelegate,LiveRoomViedoCallListCellDelegate>
@property (strong, nonatomic) UITableView *tableview;
@property (strong, nonatomic) NSArray<VideoCallListCellData *> *arrVideoCallList;
@end

@implementation VideoCallListView
-(instancetype)initWithFrame:(CGRect)frame{
    frame.origin.x = 0;
    frame.origin.y = SCREEN_HEIGHT - kVideoCallListAudienceViewHeight ;
    frame.size.width = SCREEN_WIDTH;
    frame.size.height = kVideoCallListAudienceViewHeight;
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        
        //**********************************【临时】************************************************
        NSMutableArray *arrTem = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0 ; i++; i<20) {
            VideoCallListCellData *data = [[VideoCallListCellData alloc] initWithData:@{@"alias" : @"test20003",
                                                                                        @"flag" : @"1",
                                                                                        @"from" : @"2",
                                                                                        @"picuser" : @"https://vi2.6rooms.com/live/2015/04/01/11/1003v1427859416567295472.jpg",
                                                                                        @"rank" : @"1",
                                                                                        @"rid" : @"57076490",
                                                                                        @"uid" : @"45077265"}];
            [arrTem addObject:data];
        }
        self.arrVideoCallList = [arrTem copy];
        //**********************************【临时】************************************************
    }
    return self;
}

-(void)createUI{
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, kVideoCallListAudienceViewHeight, SCREEN_WIDTH, kVideoCallListAudienceViewHeight)];
    self.tableview.backgroundColor = [UIColor clearColor];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    [self addSubview:self.tableview];
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrVideoCallList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CIdentifier = @"CellIdentifier";
    LiveRoomViedoCallListCell *cell = [tableView dequeueReusableCellWithIdentifier:CIdentifier];
    
    
    if (cell == nil) {
        cell = [[LiveRoomViedoCallListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
//    if ([ApplicationDelegate getFullScreenLiveRoomVisible]) {
//        [cell configData:self.arrVideoCallList[[self.arrVideoCallList count] -1 -indexPath.row] withType:EnumVideoCallCellTypeAudience];
//    }else if([ApplicationDelegate getPublishRoomVisible]){
//        [cell configData:self.arrVideoCallList[[self.arrVideoCallList count] -1 -indexPath.row] withType:EnumVideoCallCellTypeAnchor];
//    }
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kVideoCallListCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    [ApplicationDelegate showFullScreenUserOperate:self.arrVideoCallList[[self.arrVideoCallList count] -1 -indexPath.row].uid];
}

#pragma mark - Cell Delegate
-(void)callbackCancelBtnAction:(NSString *)targetUid{
//    [self.managerVideoCall cancelVideoCallRequestWithUID:targetUid];
}
// 用户取消，主播拒绝 走同一个接口
-(void)callbackRefuseBtnAction:(NSString *)targetUid{
//    [self.managerVideoCall cancelVideoCallRequestWithUID:targetUid];
}
-(void)callbackAgreeBtnAction:(RoomVideoCallUserData *)targetUserData{
//    if (!model.isVideoCallOnProgress) {
//        if ([ApplicationDelegate getPublishRoomVisible]) {
//
//            [self.managerVideoCall agreeVideoCallRequestWithUID:targetUserData.uid];
//            //            self.targetUid = targetUid;
//
//            [self changeState:EnumVideoCallListAnchorViewTypeWaiting withUserData:targetUserData];
//            self.viewTopBar.isWaitingVideoToAnchor = NO;
//        }
//    }else{
//        UIPerfectAlertView *alert = [[UIPerfectAlertView alloc] initWithTitle:@"失败"
//                                                                      message:@"当前正在连麦"
//                                                                     delegate:nil
//                                                            cancelButtonTitle:@"确定"
//                                                            otherButtonTitles:nil];
//        [alert show];
//    }
}


@end
