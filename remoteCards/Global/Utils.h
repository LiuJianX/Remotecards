//
//  Utils.h
//  E-Campus
//
//  Created by liujianx on 15/7/20.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PaperAnswer.h"
#import "StudentMaster.h"
#import "SetupData.h"
#import "AnswerData.h"
#import <CommonCrypto/CommonCryptor.h>

/***************************************************************************
 *
 * 工具类
 *
 ***************************************************************************/

@class AppDelegate; 

@interface Utils : NSObject

+ (void)setScreenWidth:(float)width;
+ (float)getScreenWidth;

+ (void)setScreenHeight:(float)height;
+ (float)getScreenHeight;
 

/*
 AppDelegate
 */

+(AppDelegate *)applicationDelegate;
 
+ (UIImageView *)imageViewWithFrame:(CGRect)frame withImage:(UIImage *)image;

+ (UILabel *)labelWithFrame:(CGRect)frame withTitle:(NSString *)title titleFontSize:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor alignment:(NSTextAlignment)textAlignment;


#pragma mark - alertView提示框
+(UIAlertView *)alertTitle:(NSString *)title message:(NSString *)msg delegate:(id)aDeleagte cancelBtn:(NSString *)cancelName otherBtnName:(NSString *)otherbuttonName;
#pragma mark - btnCreate
+(UIButton *)createBtnWithType:(UIButtonType)btnType frame:(CGRect)btnFrame backgroundColor:(UIColor*)bgColor;

#pragma mark isValidateEmail


/**
 *  正则难电子邮箱是否合法
 *
 *  @param email 电子邮箱名称
 *
 *  @return 成功:true
 */
+(BOOL)isValidateEmail:(NSString *)email;


+(BOOL)isValidatePassword:(NSString *)password;


/**
 *  信息提示框，3秒后自动关闭
 *
 *  @param str    提示信息
 *  @param uiview 当前视图
 */
+(void)showMBAllTextDialog:(NSString *)str view:(UIView *)uiview;



+ (void)saveUserDefaultsData:(NSString *)key value:(NSString *) value;

+ (NSString *)loadUserDefaultsData:(NSString *)key;

+ (void)saveLoginAMap:(AnswerData *)data;
+(NSString *)getFullDatabasePathFromFileName:(NSString *)name;

+ (AnswerData *)loadLoginAMapWithKey;

/**
 *  信息提示框
 *
 *  @param str 提示信息
 */
+(void)showAllTextDialog:(NSString *)str;


/**
 *  保存登录信息
 *
 *  @param obj 登录实体信息
 */
+ (void)saveCustomObject:(StudentMaster *)obj;

/**
 *  获取本地登录对象信息
 *
 *  @param key 要查找的关键字
 *
 *  @return 查询到的登录对象
 */
+ (StudentMaster *)loadCustomObjectWithKey:(NSString *)key;

/**
 *  加载消息框
 *
 *  @param view 当前视图
 *  @param msg  需要显示的信息
 */
+(void) loadProgress:(UIView *)view label:(NSString *)msg;

/**
 *  利用正则验证手机号友是否合法
 *
 *  @param phone 手机号码
 *
 *  @return <#return value description#>
 */
+(BOOL)isValidatePhone:(NSString *)phone;

/**
 *  将图片转换成UIIMage
 *
 *  @param imageName 图片名称
 *
 *  @return UIIMage
 */
+(UIImage *) loadImageWith:(NSString *)imageName;

 
/**
 *  生成随机整数
 *
 *  @param buildNum 需要生成数的个数
 *  @param allNum   多少数值内所产生的数.
 *
 *  @return <#return value description#>
 */
+(NSMutableArray *) buildRandomNum:(int )buildNum CountNum:(int) allNum IsRandom: (BOOL) isRandom;

/**
 *  比较数值
 *
 *  @param mutArr <#mutArr description#>
 *  @param index  <#index description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)compare:(NSMutableArray *)mutArr andNum:(int)index;

/**
 *  保存本地 NSUserDefaults 数据对象
 *
 *  @param obj 登录实体信息
 */
+ (void)saveUserDefaults:(NSMutableArray *)obj  userDefaultsKey:(NSString *)key;

/**
 *  获取本地 NSUserDefaults 数据对象
 *
 *  @param key 要查找的关键字
 *
 *  @return 查询到的登录对象
 */
+ (NSMutableArray *)loadUserDefaults:(NSString *)key;

/**
 *  获取本地数据库文件
 *
 *  @return <#return value description#>
 */
+(NSString *)getDataBaseFile;

/**
 *  清除所有本地保存数据.
 */
+(void)resetDefaults;


+ (void)savePaperAnswerObject:(PaperAnswer *)obj;
/**
 *  获取本地登录对象信息
 *
 *  @param key 要查找的关键字
 *
 *  @return 查询到的登录对象
 */
+ (PaperAnswer *)loadPaperAnswerObjectWithKey:(NSString *)key;

/**
 *  获取当前时间
 *
 *  @param fromat 时间格式
 *
 *  @return 当前时间
 */
+(NSString *)getCurrentDate:(NSString *)fromat;

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

+ (void)saveLoginUser:(NSString *)email;

+ (NSString *)loadLoginUserWithKey;

+ (void)saveSetupDataObject:(SetupData *)obj;

+ (SetupData *)loadSetupDataObjectWithKey;

+(NSString*)encryptWithContent:(NSString *)content type:(CCOperation)type key:(NSString *)aKey;
    
    
@end
