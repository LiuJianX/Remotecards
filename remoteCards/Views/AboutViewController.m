//
//  AboutViewController.m
//  eCampus
//
//  Created by liujianx on 15/9/4.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "AboutViewController.h"
#import "Common.h"
//#import "QRCodeGenerator.h"
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"

@interface AboutViewController (){
    UIImage *img;
    UIImage *imgLook;
    NSString *updatePath,*longitude,*latitude,*isMap,*isPhoto;
    NSDate *serverDateTime;
    BOOL isFrist;
    NSMutableArray* buttons;
    MZTimerLabel *timerServTime,*timerDownCount;
    
}

@end

@implementation AboutViewController

- (void)configLocationManager
{
    self.locationManager = [[AMapLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    //设置允许在后台定位
    [self.locationManager setAllowsBackgroundLocationUpdates:NO];
    
}


#pragma mark - 检查相机权限
- (BOOL)canUserCamear{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请打开相机权限" message:@"设置-隐私-相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        alertView.tag = 100;
        [alertView show];
        return NO;
    }
    else{
        return YES;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
- (void)initAMapView
{
    if (self.mapView == nil)
    {
        self.mapView = [[MAMapView alloc] initWithFrame:self.viewMap.bounds];
        [self.mapView setDelegate:self];
        [self.viewMap addSubview:self.mapView];
        
        [self.mapView setMaxZoomLevel:19];
        
        [self.mapView setMinZoomLevel:16];
        
        self.mapView.showsCompass = NO;
        
        self.mapView.showsUserLocation = YES;
        
        self.mapView.scrollEnabled =  NO;
        
        //  self.mapView.zoomEnabled = NO;
        
        UIView *zoomPannelView = [self makeZoomPannelView];
        zoomPannelView.center = CGPointMake(self.view.bounds.size.width -  CGRectGetMidX(zoomPannelView.bounds) - 10,
                                            self.view.bounds.size.height -  CGRectGetMidY(zoomPannelView.bounds) - 10);
        
        zoomPannelView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
        [self.view addSubview:zoomPannelView];
        
        self.gpsButton = [self makeGPSButtonView];
        self.gpsButton.center = CGPointMake(CGRectGetMidX(self.gpsButton.bounds) + 10,
                                            self.view.bounds.size.height -  CGRectGetMidY(self.gpsButton.bounds) - 20);
        [self.view addSubview:self.gpsButton];
        self.gpsButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
        
        
    }
    
    AnswerData *model = [Utils loadLoginAMapWithKey];
    
    [self.mapView setZoomLevel:[model.questionAsnwer doubleValue] animated:NO];
    
    
}


- (UIButton *)makeGPSButtonView {
    UIButton *ret = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    ret.backgroundColor = [UIColor whiteColor];
    ret.layer.cornerRadius = 4;
    
    [ret setImage:[UIImage imageNamed:@"gpsStat1"] forState:UIControlStateNormal];
    [ret addTarget:self action:@selector(gpsAction) forControlEvents:UIControlEventTouchUpInside];
    
    return ret;
}

- (UIView *)makeZoomPannelView
{
    UIView *ret = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 53, 98)];
    
    UIButton *incBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 53, 49)];
    [incBtn setImage:[UIImage imageNamed:@"increase"] forState:UIControlStateNormal];
    [incBtn sizeToFit];
    [incBtn addTarget:self action:@selector(zoomPlusAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *decBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 49, 53, 49)];
    [decBtn setImage:[UIImage imageNamed:@"decrease"] forState:UIControlStateNormal];
    [decBtn sizeToFit];
    [decBtn addTarget:self action:@selector(zoomMinusAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [ret addSubview:incBtn];
    [ret addSubview:decBtn];
    
    return ret;
}

- (void)zoomPlusAction
{
    CGFloat oldZoom = self.mapView.zoomLevel;
    [self.mapView setZoomLevel:(oldZoom + 1) animated:YES];
}

- (void)zoomMinusAction
{
    CGFloat oldZoom = self.mapView.zoomLevel;
    [self.mapView setZoomLevel:(oldZoom - 1) animated:YES];
}

- (void)gpsAction {
    if(self.mapView.userLocation.updating && self.mapView.userLocation.location) {
        [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
        [self.gpsButton setSelected:YES];
    }
}



-(void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    //  NSLog(@"regionDidChangeAnimated");
    
    AnswerData *model = [[AnswerData alloc ]init];
    model.questionAsnwer = [NSString stringWithFormat:@"%.1f",self.mapView.zoomLevel];
    
    [Utils saveLoginAMap:model];
    
}

#pragma mark - AMapLocationManager Delegate

- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%s, amapLocationManager = %@, error = %@", __func__, [manager class], error);
}

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
    
    if(isFrist == false){
        isFrist = true;
        _lblLat.text = [NSString stringWithFormat:@"%f",location.coordinate.latitude];
        _lblLon.text = [NSString stringWithFormat:@"%f",location.coordinate.longitude];
        
        NSLog(@"location:{lat:%f; lon:%f; accuracy:%f; reGeocode:%@}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy, reGeocode.formattedAddress);
        
        //获取到定位信息，更新annotation
        if (self.pointAnnotaiton == nil)
        {
            self.pointAnnotaiton = [[MAPointAnnotation alloc] init];
            [self.pointAnnotaiton setCoordinate:location.coordinate];
            
            [self.mapView addAnnotation:self.pointAnnotaiton];
        }
        
        [self.pointAnnotaiton setCoordinate:location.coordinate];
        
        [self.mapView setCenterCoordinate:location.coordinate];
        
        
        // self.mapView.scrollEnabled = NO;
        
        // self.mapView.zoomEnabled = NO;
        
    }
}

-(void) onRadioButtonValueChanged:(RadioButton*)sender
{
    // Lets handle ValueChanged event only for selected button, and ignore for deselected
    if(sender.selected) {
        //
        if([sender.titleLabel.text isEqualToString:@"上班卡"]){
            _isIn = true;
        }else{
            _isIn = false;
        }
        // NSLog(@"Selected color: %@", );
    }
}

- (void) initContorl{
    float x = 3; //[Utils getScreenWidth] - 110;
    
    buttons = [NSMutableArray arrayWithCapacity:3];
    CGRect btnRect = CGRectMake(x, 70, 230, 40);
    for (NSString* optionTitle in @[@"上班卡", @"下班卡"]) {
        RadioButton* btn = [[RadioButton alloc] initWithFrame:btnRect];
        [btn addTarget:self action:@selector(onRadioButtonValueChanged:) forControlEvents:UIControlEventValueChanged];
        btnRect.origin.y += 40;
        [btn setTitle:optionTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = HYQIHEISIZE(18);
        [btn setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        [self.view addSubview:btn];
        [buttons addObject:btn];
    }
    
    [buttons[0] setGroupButtons:buttons]; // Setting buttons into the group
    
    [buttons[0] setSelected:YES]; // Making the first button initially selected
    
    
    _lblServ  = [[UILabel alloc] initWithFrame:CGRectMake(x, 85 + 70, 230,20)];
    
    _lblServ.text=@"服务器时间";
    [_lblServ setFont:HYQIHEISIZE(16)];
    [self.view addSubview:_lblServ];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    
    _lblServDate  = [[UILabel alloc] initWithFrame:CGRectMake(x, 105 + 70, 230,30)];
    [_lblServDate setTextAlignment:NSTextAlignmentLeft];
    [_lblServDate setFont:HYQIHEISIZE(18)];
    //  [_lblServDate setTextColor:NavFontColor];
    _lblServDate.text = strDate ;
    [self.view addSubview:_lblServDate];
    
    _lblServTime  = [[UILabel alloc] initWithFrame:CGRectMake(x, 130 + 70, 230,30)];
    
    [_lblServTime setTextAlignment:NSTextAlignmentLeft];
    [_lblServTime setFont:HYQIHEISIZE(18)];
    [_lblServTime setTextColor:NavFontColor];
    _lblServTime.text = strDate ;
    [self.view addSubview:_lblServTime];
    
    
    UILabel *label1  = [[UILabel alloc] initWithFrame:CGRectMake(x, 155 + 70, 230,30)];
    
    label1.text=@"纬度";
    [label1 setFont:HYQIHEISIZE(18)];
    [self.view addSubview:label1];
    
    
    _lblLat = [[UILabel alloc] initWithFrame:CGRectMake(x, 180 + 70, 230,30)];
    
    _lblLat.text=@"888.888888";
    [_lblLat setFont:HYQIHEISIZE(18)];
    [_lblLat setTextColor:NavFontColor];
    [self.view addSubview:_lblLat];
    
    
    UILabel *label2  = [[UILabel alloc] initWithFrame:CGRectMake(x, 205 + 70, 230,30)];
    
    label2.text=@"经度";
    [label2 setFont:HYQIHEISIZE(18)];
    
    [self.view addSubview:label2];
    
    
    _lblLon = [[UILabel alloc] initWithFrame:CGRectMake(x, 230 + 70, 230,30)];
    
    _lblLon.text=@"888.888889";
    [_lblLon setFont:HYQIHEISIZE(18)];
    [_lblLon setTextColor:NavFontColor];
    
    [self.view addSubview:_lblLon];
    
    _focusView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, 80, 80)];
    _focusView.layer.borderWidth = 1.0;
    _focusView.layer.borderColor =[UIColor greenColor].CGColor;
    _focusView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_focusView];
    _focusView.hidden = YES;
    
    
    _btnCheckUpdate = [[UIButton alloc] initWithFrame:CGRectMake(x,280 + 70,98, 55)];
    _btnCheckUpdate.backgroundColor = NavFontColor;
    [_btnCheckUpdate setTitle:@"打卡"  forState:UIControlStateNormal];
    [_btnCheckUpdate addTarget:self action:@selector(shutterCamera:) forControlEvents:UIControlEventTouchUpInside];
    _btnCheckUpdate.titleLabel.font = HYQIHEISIZE(26);
    [self.view addSubview:_btnCheckUpdate];
    
    
    float fh = [Utils getScreenHeight] / 5 * 2;
    float fh2 = [Utils getScreenHeight] / 5 * 3;
    
    UIImageView *imgLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, fh2, [Utils getScreenWidth], 1)];
    imgLine.image = [UIImage imageNamed:@"login_textfield_mid"];
    [self.view addSubview:imgLine];
    
    _viewMap = [[UIView alloc]initWithFrame:CGRectMake(0,fh2, [Utils getScreenWidth], fh)];
    [self.view  addSubview:_viewMap];
    
    [_btnBack addTarget:self action:@selector(getMapBack:) forControlEvents:UIControlEventTouchUpInside];
    _btnBack.titleLabel.font = HYQIHEISIZE(16);
    [self.view addSubview:_btnBack];
    
    [self initServerTime];
    
}

- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;  
    }  
    
    // And now we just create a new UIImage from the drawing context  
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);  
    UIImage *img = [UIImage imageWithCGImage:cgimg];  
    CGContextRelease(ctx);  
    CGImageRelease(cgimg);  
    return img;  
}

- (void) shutterCamera:(id)sender {
   
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"打卡中,请稍候...";
    
    isFrist = false;
    [self.locationManager startUpdatingLocation];
    
    //    CGPoint point =  CGPointMake(0.0f, 0.0f); //[gesture locationInView:gesture.view];
    //    [self focusAtPoint:point];
    
    
    AVCaptureConnection * videoConnection = [self.ImageOutPut connectionWithMediaType:AVMediaTypeVideo];
    if (!videoConnection) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];

        NSLog(@"take photo failed!");
        return;
    }
    
    [self.ImageOutPut captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer == NULL) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            return;
        }
        
        
        
        NSData * imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        self.image = [UIImage imageWithData:imageData];
        [self.session stopRunning];
        
        self.image = [self fixOrientation:self.image];
        
         NSString *base64Encoded = @"";
        
        if([isPhoto isEqualToString:@"1"]){
            
            NSData *nsdata = UIImageJPEGRepresentation(self.image,1);
            
            base64Encoded = [nsdata base64EncodedStringWithOptions:0];
        
            
            CGRect inRect = self.viewMap.bounds;
            
            self.screenshotImage = [self.mapView takeSnapshotInRect:inRect];
            
            
            if([isMap isEqualToString:@"1"]){
                
                CGSize size = CGSizeMake(self.image.size.width ,self.image.size.height+self.screenshotImage.size.height);
                
                UIGraphicsBeginImageContext(size);
                [self.image drawInRect:CGRectMake(0, 0, self.image.size.width, self.image.size.height)];
                
                [self.screenshotImage drawInRect:CGRectMake(0,self.image.size.height, self.image.size.width, self.screenshotImage.size.height)];
                
                UIImage *togetherImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                
                NSData *nsdata = UIImageJPEGRepresentation(togetherImage,1);
                
                base64Encoded = [nsdata base64EncodedStringWithOptions:0];
                
            }
        }
        NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/FileUpload"]];
        ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:url];
        
        NSDateFormatter *format=[[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        
        NSString *strDate = [NSString stringWithFormat:@"%@ %@",[format stringFromDate:serverDateTime],_lblServTime.text];
        
        [requestForm setPostValue:studented.employee_ID forKey:@"userId"];
        
        [requestForm setPostValue:strDate forKey:@"dateTime"];
        
        [requestForm setPostValue:base64Encoded forKey:@"imgBase64"];
        
        NSString *strIn =_isIn ? @"1" : @"0";
        
        [requestForm setPostValue: strIn forKey:@"inOut"];
        
        [requestForm setPostValue: _lblLon.text forKey:@"longitude"];
        [requestForm setPostValue: _lblLat.text forKey:@"latitude"];
        
        
        [requestForm setDelegate:self];
        
        [requestForm setDidFailSelector:@selector(requestProgessFailed:)];
        
        [requestForm setDidFinishSelector:@selector(requestProgessSuccess:)];
        
        [requestForm setTimeOutSeconds:timeOut];
        [requestForm startSynchronous];
        
        
        
    }];
}
- (BOOL) imageHasAlpha: (UIImage *) image
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

- (NSString *) image2DataURL: (UIImage *) image
{
    NSData *imageData = nil;
    NSString *mimeType = nil;
    
    if ([self imageHasAlpha: image]) {
        imageData = UIImagePNGRepresentation(image);
        mimeType = @"image/png";
    } else {
        imageData = UIImageJPEGRepresentation(image, 1.0f);
        mimeType = @"image/jpeg";
    }
    
    return [NSString stringWithFormat:@"data:%@;base64,%@", mimeType,
            [imageData base64EncodedStringWithOptions: 0]];
    
}

- (void)requestProgessSuccess:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    @try{
        if (request.responseStatusCode == 200) {
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            
            NSString *errMsg = [responseDict objectForKey:@"errMsg"];
            if(errMsg !=nil && ![errMsg isEqualToString:@""]){
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [Utils showAllTextDialog: [NSString stringWithFormat:@"发生错误,原因:%@",errMsg]];
                
                return;
            }
            
            //初始化AlertView
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"系统提示"
                                                            message:@"打卡成功"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil ,nil];
            
            alert.tag = 3;
            [alert show];
            
            //   [Utils showMBAllTextDialog:@"打卡成功." view:self.view];
            
            
            
        } else {
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception] ];
        
    }@finally{
        
    }
    
}

- (void)requestProgessFailed:(ASIHTTPRequest *)request{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [ Utils showAllTextDialog:@"网络超时,请稍后再试!"];
    
}


#pragma - 保存至相册
- (void)saveImageToPhotoAlbum:(UIImage*)savedImage {
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}
// 指定回调方法

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片结果提示"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}


- (void)focusGesture:(UITapGestureRecognizer*)gesture{
    CGPoint point = [gesture locationInView:gesture.view];
    [self focusAtPoint:point];
}

- (void)focusAtPoint:(CGPoint)point{
    
    CGSize size = self.view.bounds.size;
    CGPoint focusPoint = CGPointMake( point.y /size.height ,1-point.x/size.width );
    NSError *error;
    if ([self.device lockForConfiguration:&error]) {
        
        if ([self.device isFocusModeSupported:AVCaptureFocusModeAutoFocus]) {
            [self.device setFocusPointOfInterest:focusPoint];
            [self.device setFocusMode:AVCaptureFocusModeAutoFocus];
        }
        
        if ([self.device isExposureModeSupported:AVCaptureExposureModeAutoExpose ]) {
            [self.device setExposurePointOfInterest:focusPoint];
            [self.device setExposureMode:AVCaptureExposureModeAutoExpose];
        }
        
        [self.device unlockForConfiguration];
        _focusView.center = point;
        _focusView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            _focusView.transform = CGAffineTransformMakeScale(1.25, 1.25);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                _focusView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                _focusView.hidden = YES;
            }];
        }];
    }
    
}


-(void)initServerTime{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"获取服务器时间,请稍候...";
    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/GetDateTime"]];
    
    
    
    ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestForm setPostValue:studented.employee_ID forKey:@"ver"];
    
    
    [requestForm setDelegate:self];
    [requestForm setTimeOutSeconds:timeOut];
    [requestForm startSynchronous];
    
}


- (void)requestFinished:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    @try{
        if (request.responseStatusCode == 200) {
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            
            NSString *srvDate = [responseDict objectForKey:@"srvDate"];
            
            
            //  KLLog(srvDate);
            
            //            if ([_device lockForConfiguration:nil]) {
            //                  [_device setFlashMode:AVCaptureFlashModeOff];
            //
            //                [_device unlockForConfiguration];
            //            }
            
            
            NSDateFormatter *format=[[NSDateFormatter alloc] init];
            [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate *date=[format dateFromString:srvDate];
            serverDateTime = date;
            
            NSDateFormatter *format1=[[NSDateFormatter alloc] init];
            [format1 setDateFormat:@"yyyy-MM-dd"];
            _lblServDate.text = [format1 stringFromDate:date];
            
            timerServTime = [[MZTimerLabel alloc] initWithLabel:_lblServTime andTimerType:MZTimerLabelTypeStopWatch];
            timerServTime.timeFormat = @"HH:mm:ss";
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"HH"];
            NSString *strHour = [dateFormatter stringFromDate:date];
            NSInteger totalHour = [strHour integerValue] * 3600;
            
            [dateFormatter setDateFormat:@"mm"];
            NSString *strMinute = [dateFormatter stringFromDate:date];
            NSInteger totalMinute = [strMinute integerValue] * 60;
            
            
            [dateFormatter setDateFormat:@"ss"];
            NSString *strSecond = [dateFormatter stringFromDate:date];
            NSInteger totalSecond =  [strSecond integerValue];
            
            NSInteger total = totalHour + totalMinute + totalSecond;
            
            
            
            _isIn = [[responseDict objectForKey:@"isIn"] boolValue];
            
                 isMap = [responseDict objectForKey:@"IsUploadMap"];
                   
            
               isPhoto = [responseDict objectForKey:@"IsUploadPhoto"];
            
            
            if(_isIn){
                [buttons[0] setSelected:YES];
            }else{
                [buttons[1] setSelected:YES];
            }
            
            
            if ([_device lockForConfiguration:nil]) {
                
                if ([_device isFlashModeSupported:AVCaptureFlashModeOff]) {
                    [_device setFlashMode:AVCaptureFlashModeOff];
                }
                
                [_device unlockForConfiguration];
            }
            [timerServTime start];
            
            
            [timerServTime addTimeCountedByTime:total];
            
            timerDownCount = [[MZTimerLabel alloc] initWithLabel:nil andTimerType:MZTimerLabelTypeTimer];
            
            timerDownCount.delegate = self;
            
            [timerDownCount setCountDownTime:DownCount];
            
            [timerDownCount start];

            
            
        } else {
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception] ];
        
    }@finally{
        
    }
    
}

- (void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (void)requestFailed:(ASIHTTPRequest *)request{
    
    [ Utils showAllTextDialog:@"网络超时,请稍后再试!"];
    
}

- (void)customCamera{
    self.view.backgroundColor = [UIColor whiteColor];
    
    @try{
        //使用AVMediaTypeVideo 指明self.device代表视频，默认使用后置摄像头进行初始化
        self.device = [self cameraWithPosition: AVCaptureDevicePositionFront];
        
        //[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        // self.device devicesWithMediaType
        //使用设备初始化输入
        self.input = [[AVCaptureDeviceInput alloc]initWithDevice:self.device error:nil];
        
        //生成输出对象
        self.output = [[AVCaptureMetadataOutput alloc]init];
        self.ImageOutPut = [[AVCaptureStillImageOutput alloc] init];
        
        
        //生成会话，用来结合输入输出
        self.session = [[AVCaptureSession alloc]init];
        if ([self.session canSetSessionPreset:AVCaptureSessionPreset640x480]) {
            self.session.sessionPreset = AVCaptureSessionPreset640x480;
            
        }
        if ([self.session canAddInput:self.input]) {
            [self.session addInput:self.input];
        }
        
        if ([self.session canAddOutput:self.ImageOutPut]) {
            [self.session addOutput:self.ImageOutPut];
        }
        
        // self.device = [self cameraWithPosition:AVCaptureDevicePositionFront];
        //animation.subtype = kCATransitionFromRight;
        
        //使用self.session，初始化预览层，self.session负责驱动input进行信息的采集，layer负责把图像渲染显示
        self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
        
        float fh = [Utils getScreenHeight] / 5 * 3;
        //  float fh2 = [Utils getScreenHeight] / 3 * 2;
        
        self.previewLayer.frame = CGRectMake(110, 63, [Utils getScreenWidth] , fh);
        
        self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        
        [self.view.layer addSublayer:self.previewLayer];
        
        //开始启动
        [self.session startRunning];
        if ([_device lockForConfiguration:nil]) {
            if ([_device isFlashModeSupported:AVCaptureFlashModeAuto]) {
                [_device setFlashMode:AVCaptureFlashModeAuto];
            }
            //自动白平衡
            if ([_device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeAutoWhiteBalance]) {
                [_device setWhiteBalanceMode:AVCaptureWhiteBalanceModeAutoWhiteBalance];
            }
            [_device unlockForConfiguration];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"调用相机发生错误,原因:%@",exception] ];
        
    }
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    studented = [Utils loadCustomObjectWithKey:LoginKey];
    
    if(studented == nil){
        [Utils showMBAllTextDialog:@"未获取到当前登录用户名称,请重新登录." view:self.view];
        return;
    }
    if([_lblServTime.text isEqualToString:@""]){
        
        [Utils showMBAllTextDialog:@"服务器时间获取失败,不允许进行打卡." view:self.view];
        return;
    }
    _canCa = [self canUserCamear];
    if (_canCa) {
        [self customCamera];
        
    }else{
        return;
    }
    
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回"                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(backButtonData:)];
    [backButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:studented.name
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self action:nil];
    [rightButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    
    [self initContorl];
    
    [self initAMapView];
    
    [self configLocationManager];
    
}
//返回
- (void)backButtonData :(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for ( AVCaptureDevice *device in devices )
        if ( device.position == position ) return device;
    return nil;
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear: animated];
    if (self.session) {
        [self.session stopRunning];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    isFrist = false;
    if (self.session) {
        [self.session startRunning];
    }
    [self.locationManager startUpdatingLocation];
}

- (void)mapViewWillStartLocatingUser:(MAMapView *)mapView{
    
    if(![CLLocationManager locationServicesEnabled]){
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"定位失败" message:@"请在手机设置中开启定位功能\n开启步骤:设置 > 隐私 > 定位服务下的《超源打卡》应用" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
        return;
    }
}

-  (void)getMapBack:(id)sender{
    
    isFrist = false;
    
    [self.locationManager startUpdatingLocation];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {
        //软件需要更新提醒
        //  if (buttonIndex == 1) {
        // NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/wan-zhuan-quan-cheng/id%i?mt=8",iFeverAPPID]];
        
        NSURL *url = [NSURL URLWithString:updatePath];
        
        [[UIApplication sharedApplication] openURL:url];
        
        //   }
    }else if (alertView.tag == 3){
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}


@end
