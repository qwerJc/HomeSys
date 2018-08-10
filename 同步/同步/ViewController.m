//
//  ViewController.m
//  同步
//
//  Created by 贾辰 on 18/7/8.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import "VideoCallRoomSpeakingAnimationView.h"
#import "temModel.h"

#define VoiceCallRoomAnchorRight 5||1

@interface ViewController ()
@property (strong, nonatomic) UIImageView *imgvBird2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]
}
-(void)start{
    [UIView animateWithDuration:3 animations:^{
        _imgvBird2.center = CGPointMake([UIScreen mainScreen].bounds.size.width - 20, 100);
    } completion:^(BOOL finished) {
        _imgvBird2.center = CGPointMake(20, 250);
        [self start];
    }];
}
-(void)hideLoadingView{
    [_imgvBird2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Bird%ld",(long)_imgvBird2.tag]]];
    if (_imgvBird2.tag == 4) {
        _imgvBird2.tag = 1;
    }else{
        _imgvBird2.tag++;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger )getMaxValue:(NSArray <NSString *>*)arr{
    NSInteger max = [[arr firstObject] integerValue];
    for (NSString *item in arr) {
        if (max > [item integerValue]) {
            max = [item integerValue];
        }
    }
    return max;
}
@end
