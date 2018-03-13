//
//  ViewController.m
//  Camera
//
//  Created by 贾辰 on 2018/3/12.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "SonViewController.h"

@interface ViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImageView *imgv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self; //设置代理
    _imagePicker.allowsEditing = YES;
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 10, 130, 80)];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 setTitle:@"Camera" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(onCamera) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(200, 10, 130, 80)];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setTitle:@"Album" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(onAlbum) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 130, 80)];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setTitle:@"Post" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(onPost) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 130, 80)];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 setTitle:@"Get" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(onGet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 130, 80)];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 setTitle:@"PUSH" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(onPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
    _imgv = [[UIImageView alloc] initWithFrame:CGRectMake(200, 400, 200, 200)];
    [_imgv setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_imgv];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)onCamera{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;//图片来源
        _imagePicker.showsCameraControls = YES;//使用系统默认拍照按钮
        [self presentViewController:_imagePicker animated:YES completion:nil];
    }else{
        NSLog(@"no spose camera");
    }
    
}

-(void)onPush{
    SonViewController *vc = [[SonViewController alloc] init];
    vc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    [self setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:vc animated:YES completion:nil];
    
    //    [self.navigationController pushViewController:vc animated:YES];
}

-(void)onAlbum{
    //NSLog(@"相册");
    _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:_imagePicker animated:YES completion:nil];
}

-(void)onPost{
    
}
//https://www.jianshu.com/p/7fd3410b71a8

//在Info.plist中添加NSAppTransportSecurity类型Dictionary。
//在NSAppTransportSecurity下添加NSAllowsArbitraryLoads类型Boolean,值设为YES

//http://blog.csdn.net/sinat_31177681/article/details/51433171
-(void)onGet{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//
//    NSString *getVersionURL = [@"http://101.132.38.221" stringByAppendingString:@"/ReactNatieWallPage/GetVersion.php"];
//
//    [manager GET:getVersionURL parameters:nil progress:nil
//         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//             NSLog(@"【--------------网络获取成功--------------】");
//             NSError *error;
//             NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject
//                                                                options:NSJSONWritingPrettyPrinted
//                                                                  error:&error];
//             NSDictionary *listDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
//             NSLog(@"list %@",listDic);
//             //服务器的JSBundle版本
////             NSString *version = [[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error] objectForKey:@"version"];
//         }
//         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
//             NSLog(@"【--------------网络获取错误，无变化--------------】");
//             NSLog(@"%@",error);  //这里打印错误信息
//         }];
}

-(void)sendImg{
//    //1.创建管理者对象
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    // 获取图片数据
//    NSData *fileData = UIImageJPEGRepresentation(self.imgv.image, 1.0);
    //    NSString *fileName = [NSString stringWithFormat:@"%@", [_arrayOfAlbum objectAtIndex:i]];
    //    [formData appendPartWithFileData:fileData name:@"image" fileName:fileName mimeType:@"image/jpeg"];
}
#pragma mark -实现图片选择器代理-（上传图片的网络请求也是在这个方法里面进行，这里我不再介绍具体怎么上传图片）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage]; //通过key值获取到图片
    [_imgv setImage:image];  //给UIimageView赋值已经选择的相片
    
    
    //上传图片到服务器--在这里进行图片上传的网络请求，这里不再介绍
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
