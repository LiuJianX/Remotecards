//
//  AboutViewController.h
//  eCampus
//
//  Created by liujianx on 15/9/4.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <AVFoundation/AVFoundation.h>
#import "RadioButton.h"
#import "StudentMaster.h"
#import "MZTimerLabel.h"

@interface AboutViewController : UIViewController  <UINavigationControllerDelegate, UIImagePickerControllerDelegate,MAMapViewDelegate, AMapLocationManagerDelegate,MZTimerLabelDelegate,AVCaptureMetadataOutputObjectsDelegate>{
    
    StudentMaster *studented;
    
}


@property (nonatomic, strong) IBOutlet RadioButton* radioButton;

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic) UIView *focusView;

@property (nonatomic, strong) AMapLocationManager *locationManager;

@property(nonatomic,assign) BOOL isIn;

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIImage *screenshotImage;

@property (nonatomic)BOOL isflashOn;
@property (nonatomic)UIImage *image;
@property (nonatomic, strong) UIButton *gpsButton;



@property (nonatomic, strong) MAPointAnnotation *pointAnnotaiton;

@property (strong, nonatomic) UIView *viewMap;
 

@property (strong, nonatomic)  UILabel *lblServ;

@property (strong, nonatomic)  UILabel *lblServTime;
@property (strong, nonatomic)  UILabel *lblServDate;

@property (strong, nonatomic)  UILabel *lblLat;

@property (strong, nonatomic)  UILabel *lblLon;
 
@property (strong, nonatomic)  UIButton *btnCheckUpdate;

@property (strong, nonatomic)  UIButton *btnBack;


@property(nonatomic,assign) BOOL canCa;

//捕获设备，通常是前置摄像头，后置摄像头，麦克风（音频输入）
@property(nonatomic)AVCaptureDevice *device;

//AVCaptureDeviceInput 代表输入设备，他使用AVCaptureDevice 来初始化
@property(nonatomic)AVCaptureDeviceInput *input;

//当启动摄像头开始捕获输入
@property(nonatomic)AVCaptureMetadataOutput *output;

@property (nonatomic)AVCaptureStillImageOutput *ImageOutPut;

//session：由他把输入输出结合在一起，并开始启动捕获设备（摄像头）
@property(nonatomic)AVCaptureSession *session;

//图像预览层，实时显示捕获的图像
@property(nonatomic)AVCaptureVideoPreviewLayer *previewLayer;

@end
