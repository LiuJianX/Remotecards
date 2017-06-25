//
//  Common.h
//  E-Campus
//
//  Created by liujianx on 15/7/20.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//


#ifndef KnowingLife_KLComment_h
#define KnowingLife_KLComment_h


#define heightDiff 68

#define timeOut 30

/**
 *  保存登录对象的key
 *
 *  @param >.0 <#>.0 description#>
 *
 *  @return <#return value description#>
 */
#define LoginKey @"stuInfo"

#define LoginEmail @"loginEmail"

/**
 *  保存生产随机数数组的key
 *
 *  @param >.0 <#>.0 description#>
 *
 *  @return <#return value description#>
 */
#define RandomKey @"examNum"

#define AnswersKey @"answerKey"

#define AnswersWrittingKey @"AnswersWritting"


/**
 *  url服务器

 *
 *  @param >.0 <#>.0 description#>
 *
 *  @return <#return value description#>
 */

//#define urlServer @"http://192.168.150.240:8083/"

#define urlServer @"http://www.cysuper.com/"

#define appUrl @"http://www.cysuper.com/card.htm"

#define updateUrl @"http://www.cysuper.com/App/Ver.js"

/**
 *  版本号
 *
 *  @param >.0 >.0 description
 *
 *  @return return value description
 */
#define EVer @"999999999"

/**
 *  sqlite本地文件名称
 *
 *  @return return value description
 */

#define DBNAME @"campus.db"

#define DBFILEPATH @"/Data/campus.db"


const static NSString *APIKey = @"aa1964937ba397db4226e2565b0438b3";

//倒计时秒
const static NSInteger DownCount= 30;


// 判断是否为ios7
#define ios7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

/**
 *  生成溢达红的颜色
 *
 *  @param r <#r description#>
 *  @param g <#g description#>
 *  @param b <#b description#>
 *
 *  @return <#return value description#>
 */

#define NavFontColor [UIColor colorWithRed:175/255.0 green:21/255.0 blue:64/255.0 alpha:1.0]


#define JobUnSecltedBackColor [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0]


#define JobUnSecltedFontColor [UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:1.0]



#define AnswerFontColor [UIColor colorWithRed:162/255.0 green:127/255.0 blue:232/255.0 alpha:1.0]

/**
 *  获得RGB颜色
 *
 *  @param r <#r description#>
 *  @param g <#g description#>
 *  @param b <#b description#>
 *
 *  @return <#return value description#>
 */
#define RGB(r, g, b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// 是否是4寸iPhone
#define is4Inch ([UIScreen mainScreen].bounds.size.height == 480)



// collectionview背景颜色
#define KLCollectionBkgCollor RGB(248, 248, 248,1);//KLColor(177,67,83);

// collectionview背景颜色
#define NavigationBarColor RGB(177,67,83,1);

// collectionview背景颜色
#define ViewSelectedColor RGB(255, 255, 255,1);//KLColor(177,67,83);

// 自定义Log
#ifdef DEBUG
#define KLLog(...) NSLog(__VA_ARGS__)
#else
#define KLLog(...)
#endif

#define diffHeight 85

//活动总步数
#define pointNumber 60

// 顶部菜单项的宽高
#define kTopMenuItemW 100
#define kTopMenuItemH 44

// 底部菜单项的宽高
#define kBottomMenuItemW 100
#define kBottomMenuItemH 40


#define FRONTWITHSIZE(frontSize) [UIFont fontWithName:@"MicrosoftYaHei" size:frontSize]
/**
 *  网易新闻字体 汉仪旗黑-55简
 *
 *  @param frontSize 字体大小
 *
 *  @return <#return value description#>
 */
#define HYQIHEISIZE(frontSize) [UIFont fontWithName:@"HYQiHei" size:frontSize]

/**
 *  网易新闻字体 汉仪旗黑-55简
 *
 *  @param 12 <#12 description#>
 *
 *  @return <#return value description#>
 */
#define HYQIHEI HYQIHEISIZE(12)


/**
 *  幼圆
 *
 *  @param frontSize <#frontSize description#>
 *
 *  @return <#return value description#>
 */
#define YOUYUANSIZE(frontSize) [UIFont fontWithName:@"YouYuan" size:frontSize]
/**
 *  幼圆 默认12号字体
 *
 *  @param 12 <#12 description#>
 *
 *  @return <#return value description#>
 */
#define YOUYUAN YOUYUANSIZE(12)



// 5.默认的动画时间
#define kDefaultAnimDuration 0.3

//申请职位选择控制
#define JonRequestNumber 1

//学生面试状态
#define RecruitNotPass @"未通过"
#define RecruitPass @"已通过"
#define RecruitHold @"待定中"



#endif
