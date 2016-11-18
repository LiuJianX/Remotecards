//
//  Utils.m
//  E-Campus
//
//  Created by liujianx on 15/7/20.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "StudentMaster.h"
#import "Common.h"
#import "SetupData.h"
#import "PaperAnswer.h"
#import "AnswerData.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

@implementation Utils

static float screenWidth = 0;

static float screenHeight = 0;


+ (void)setScreenWidth:(float)width
{
    screenWidth = width;
}
+ (float)getScreenWidth{
    return screenWidth;
}

+ (void)setScreenHeight:(float)height
{
    screenHeight = height;
}
+ (float)getScreenHeight{
    return screenHeight;
}


/*
 AppDelegate
 */
+ (AppDelegate *)applicationDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

+ (UIImageView *)imageViewWithFrame:(CGRect)frame withImage:(UIImage *)image{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    return imageView;
}

+ (UILabel *)labelWithFrame:(CGRect)frame withTitle:(NSString *)title titleFontSize:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor alignment:(NSTextAlignment)textAlignment{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.font = font;
    label.textColor = color;
    label.backgroundColor = bgColor;
    label.textAlignment = textAlignment;
    return label;
    
}


//alertView
+(UIAlertView *)alertTitle:(NSString *)title message:(NSString *)msg delegate:(id)aDeleagte cancelBtn:(NSString *)cancelName otherBtnName:(NSString *)otherbuttonName{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:aDeleagte cancelButtonTitle:cancelName otherButtonTitles:otherbuttonName, nil];
    [alert show];
    return alert;
}

+(UIButton *)createBtnWithType:(UIButtonType)btnType frame:(CGRect)btnFrame backgroundColor:(UIColor*)bgColor{
    UIButton *btn = [UIButton buttonWithType:btnType];
    btn.frame = btnFrame;
    [btn setBackgroundColor:bgColor];
    return btn;
}

//利用正则表达式验证邮箱的合法性
+(BOOL)isValidateEmail:(NSString *)email {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    // NSString *emailRegex =@"[a-z]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\\.][a-z]{2,3}([\\.][a-z]{2})?$";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
    
}
/**
 *  利用正则验证手机号友是否合法
 *
 *  @param phone 手机号码
 *
 *  @return <#return value description#>
 */
+(BOOL)isValidatePhone:(NSString *)phone{
    
    NSString *regex = @"(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:phone];
    
    
}
+(BOOL)isValidatePassword:(NSString *)password {
    
    NSString *regex = @"[\w\~\!\@\#\$\%\^\&\*\(\)\+\`\-\=\[\]\\\{\}\|\;\'\:\"\,\.\/\<\>\?0-9a-zA-z]{6,20}";
    NSPredicate *passTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [passTest evaluateWithObject:password];
    
}

/**
 *  信息提示框，3秒后自动关闭
 *
 *  @param str    提示信息
 *  @param uiview 当前视图
 */
+(void)showMBAllTextDialog:(NSString *)str view:(UIView *)uiview
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:uiview];
    [uiview addSubview:HUD];
    HUD.detailsLabelText = str;
    HUD.mode = MBProgressHUDModeText;
    
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
    
}
/**
 *  信息提示框
 *
 *  @param str 提示信息
 */
+(void)showAllTextDialog:(NSString *)str{
    UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
    [alterView show];
    
}

+ (void)saveLoginUser:(NSString *)email
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:email];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:LoginEmail];
    [defaults synchronize];     //重点
    
}

+ (NSString *)loadLoginUserWithKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *obj = [defaults objectForKey:LoginEmail];
    if(obj != nil  &&  obj != NULL ){
        return  [[NSString alloc] initWithData:obj encoding:NSUTF8StringEncoding];
    }
    return  nil;
}

+ (void)saveLoginAMap:(AnswerData *)data
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:data];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:@"AMapLevel"];
    [defaults synchronize];
}

+ (AnswerData *)loadLoginAMapWithKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *obj = [defaults objectForKey:@"AMapLevel"];
    if(obj != nil  &&  obj != NULL ){
       AnswerData *model = (AnswerData *)[NSKeyedUnarchiver unarchiveObjectWithData: obj];
        return model;
    }
    return  nil;
}


+ (void)saveUserDefaultsData:(NSString *)key value:(NSString *) value
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:value];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:key];
    [defaults synchronize];     //重点
    
}

+ (NSString *)loadUserDefaultsData:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *obj = [defaults objectForKey:key];
    if(obj != nil  &&  obj != NULL ){
        return  [[NSString alloc] initWithData:obj encoding:NSUTF8StringEncoding];
    }
    return  nil;
}



/**
 *  保存登录信息
 *
 *  @param obj 登录实体信息
 */
+ (void)saveCustomObject:(StudentMaster *)obj
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:obj];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:LoginKey];
    [defaults synchronize];     //重点
    
}

/**
 *  获取本地登录对象信息
 *
 *  @param key 要查找的关键字
 *
 *  @return 查询到的登录对象
 */
+ (StudentMaster *)loadCustomObjectWithKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *stuInfo = [defaults objectForKey:key];
    if(stuInfo != nil  &&  stuInfo != NULL ){
        StudentMaster *obj = (StudentMaster *)[NSKeyedUnarchiver unarchiveObjectWithData: stuInfo];
        return obj;
    }
    return  nil;
}

+ (void)savePaperAnswerObject:(PaperAnswer *)obj
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:obj];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:AnswersWrittingKey];
    [defaults synchronize];     //重点
    
}

/**
 *  获取本地登录对象信息
 *
 *  @param key 要查找的关键字
 *
 *  @return 查询到的登录对象
 */
+ (PaperAnswer *)loadPaperAnswerObjectWithKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *stuInfo = [defaults objectForKey:key];
    if(stuInfo != nil && stuInfo != NULL){
        PaperAnswer *obj = (PaperAnswer *)[NSKeyedUnarchiver unarchiveObjectWithData: stuInfo];
        return obj;
    }
    return  nil;
    
}



+ (void)saveSetupDataObject:(SetupData *)obj
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:obj];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:@"setupPush"];
    [defaults synchronize];     //重点
    
}

/**
 *  获取本地登录对象信息
 *
 *  @param key 要查找的关键字
 *
 *  @return 查询到的登录对象
 */
+ (SetupData *)loadSetupDataObjectWithKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"setupPush"];
    if(data != nil && data != NULL){
        SetupData *obj = (SetupData *)[NSKeyedUnarchiver unarchiveObjectWithData: data];
        return obj;
    }
    return  nil;
    
}



/**
 *  加载消息框
 *
 *  @param view 当前视图
 *  @param msg  需要显示的信息
 */
+(void) loadProgress:(UIView *)view label:(NSString *)msg {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = msg;
}

///**
// *  ajax数据请求的的委托事件
// *
// *  @param request 请求对象
// */
//+ (void)requestFailed:(ASIHTTPRequest *)request
//{
//
//    NSError *error = [request error];
//
//    [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
//
//
//}

/**
 *  将图片转换成UIIMage
 *
 *  @param imageName 图片名称
 *
 *  @return UIImage
 */
+(UIImage *) loadImageWith:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

/**
 *  生成随机整数
 *
 *  @param buildNum 需要生成数的个数
 *  @param allNum   多少数值内所产生的数.
 *
 *  @return 生成的数值组
 */
+(NSMutableArray *) buildRandomNum:(int )buildNum CountNum:(int) allNum IsRandom: (BOOL) isRandom
{
    int z = 0;
    int x = buildNum;
    NSMutableArray *mutArrGet = [NSMutableArray array];
    for (int i = 0; i < x; i++) {
        z++;
        
        if (isRandom) {
            int b = arc4random()% allNum+1;
            BOOL isUse = [self compare:mutArrGet andNum:b];
            if (isUse) {
                [mutArrGet addObject:[NSString stringWithFormat:@"%d",b]];
            }else{
                x++;
            }
        }else{
            [mutArrGet addObject:[NSString stringWithFormat:@"%d",i+1]];
        }
        if ([mutArrGet count] == buildNum) break;
    }
    
    return  mutArrGet;
}

/**
 *  比较数值
 *
 *  @param mutArr <#mutArr description#>
 *  @param index  <#index description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)compare:(NSMutableArray *)mutArr andNum:(int)index
{
    for (NSString *s in mutArr) {
        if (index == [s integerValue]) {
            return NO;
        }
    }
    return YES;
}



/**
 *  保存本地 NSUserDefaults 数据对象
 *
 *  @param obj 登录实体信息
 */
+ (void)saveUserDefaults:(NSMutableArray *)obj  userDefaultsKey:(NSString *)key
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:obj];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:key];
    [defaults synchronize];     //重点
    
}

/**
 *  获取本地 NSUserDefaults 数据对象
 *
 *  @param key 要查找的关键字
 *
 *  @return 查询到的登录对象
 */
+ (NSMutableArray *)loadUserDefaults:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *stuInfo = [defaults objectForKey:key];
    NSMutableArray *obj = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData: stuInfo];
    return obj;
}

+(NSString *)getDataBaseFile{
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"ecampus" ofType:@"bundle"]];
    NSString * strPath = [bundle pathForResource:@"campus" ofType:@"db"];
    
    return strPath;
}

+(void)resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        //保存答案.
        if(![key isEqualToString:AnswersKey]
           && ![key isEqualToString:AnswersWrittingKey]
           && ![key isEqualToString:LoginEmail]
           && ![key isEqualToString:@"setupPush"]){
            
            [defs removeObjectForKey:key];
            
        }
    }
    [defs synchronize];
}



+(NSString *)getCurrentDate:(NSString *)fromat{
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:fromat];//@"yyyy-MM-dd HH:mm:ss"];
    
    
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    return currentDateStr;
    
}

#pragma mark tableviewr所有事件结束
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
    
}




static const char* encryptWithKeyAndType(const char *text,CCOperation encryptOperation,char *key)
{
    NSString *textString=[[NSString alloc]initWithCString:text encoding:NSUTF8StringEncoding];
    //      NSLog(@"[[item.url description] UTF8String=%@",textString);
    const void *dataIn;
    size_t dataInLength;
    
    /*
     kCCEncrypt = 0,
     kCCDecrypt,
     
     */
    if (encryptOperation == kCCDecrypt)//传递decrypt 解码
    {
        //解码 base64
        NSData *decryptData = [GTMBase64 decodeData:[textString dataUsingEncoding:NSUTF8StringEncoding]];//转utf-8并decode
        dataInLength = [decryptData length];
        dataIn = [decryptData bytes];
    }
    else  //encrypt
    {
        NSData* encryptData = [textString dataUsingEncoding:NSUTF8StringEncoding];
        dataInLength = [encryptData length];
        dataIn = (const void *)[encryptData bytes];
    }
    
    
    CCCryptorStatus ccStatus;
    uint8_t *dataOut = NULL; //理解位type/typedef 缩写（效维护代码比：用int用long用typedef定义）
    size_t dataOutAvailable = 0; //size_t  操作符sizeof返结类型
    size_t dataOutMoved = 0;
    
    dataOutAvailable = (dataInLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    dataOut = malloc( dataOutAvailable * sizeof(uint8_t));
    memset((void *)dataOut, 00, dataOutAvailable);//已辟内存空间buffer首 1 字节值设值 0
    
    //NSString *initIv = @"12345678";
    const void *vkey = key;
    const void *iv = (const void *) key; //[initIv UTF8String];
    
    //CCCrypt函数 加密/解密
    ccStatus = CCCrypt(encryptOperation,//  加密/解密
                       kCCAlgorithmDES,//  加密根据哪标准（des3desaes）
                       kCCOptionPKCS7Padding,//  选项组密码算(des:每块组加密  3DES：每块组加三同密)
                       vkey,  //密钥    加密解密密钥必须致
                       kCCKeySizeDES,//   DES 密钥（kCCKeySizeDES=8）
                       iv, //  选初始矢量
                       dataIn, // 数据存储单元
                       dataInLength,// 数据
                       (void *)dataOut,// 用于返数据
                       dataOutAvailable,
                       &dataOutMoved);
    
    NSString *result = nil;
    
    if (encryptOperation == kCCDecrypt)//encryptOperation==1  解码
    {
        //解密data数据改变utf-8字符串
        result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)dataOut length:(NSUInteger)dataOutMoved] encoding:NSUTF8StringEncoding];
    }
    else //encryptOperation==0  （加密程加密数据转base64）
    {
        //编码 base64
        NSData *data = [NSData dataWithBytes:(const void *)dataOut length:(NSUInteger)dataOutMoved];
        result = [GTMBase64 stringByEncodingData:data];
    }
    
    return [result UTF8String];
    
}

+(NSString*)encryptWithContent:(NSString*)content type:(CCOperation)type key:(NSString*)aKey
{
    const char * contentChar =[content UTF8String];
    char * keyChar =(char*)[aKey UTF8String];
    const char *miChar;
    miChar = encryptWithKeyAndType(contentChar, type, keyChar);
    return  [NSString stringWithCString:miChar encoding:NSUTF8StringEncoding];
}

@end
