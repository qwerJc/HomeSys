//
//  ViewController.m
//  Camera
//
//  Created by 贾辰 on 2018/3/12.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImageView *imgv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self; //设置代理
    _imagePicker.allowsEditing = YES;
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 130, 80)];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 setTitle:@"Camera" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(onCamera) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 130, 80)];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setTitle:@"Album" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(onAlbum) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    _imgv = [[UIImageView alloc] initWithFrame:CGRectMake(200, 300, 200, 200)];
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
-(void)onAlbum{
    //NSLog(@"相册");
    _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:_imagePicker animated:YES completion:nil];
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
