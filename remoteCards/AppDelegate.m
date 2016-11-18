//
//  AppDelegate.m
//  remoteCards
//
//  Created by liujianxiong on 2016/11/8.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "Common.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "MobClick.h"


@interface AppDelegate (){
    NSString *updatePath;
}

@end

@implementation AppDelegate

- (void)configureAPIKey
{
    if ([APIKey length] == 0)
    {
        NSString *reason = [NSString stringWithFormat:@"apiKey为空，请检查key是否正确设置。"];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:reason delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    [AMapServices sharedServices].apiKey = (NSString *)APIKey;
}


/**
 *  检测软件是否需要升级
 */
-(void)checkVersion
{
    //NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%i",iFeverAPPID]];
    
    NSURL *url = [NSURL URLWithString:updateUrl];
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc]initWithURL:url];
    [request setUseCookiePersistence:YES];
    [request setDelegate: self];
    [request setDidFailSelector:@selector(getVersionRequestFailed:)];
    [request setDidFinishSelector:@selector(getVersionRequestSuccess:)];
    [request startAsynchronous];//开始异步请求
}

-(void)getVersionRequestFailed:(ASIHTTPRequest *)request1
{
    KLLog(@"从AppStore获取版本信息失败！！");
}

-(void)getVersionRequestSuccess:(ASIHTTPRequest *)request1
{
    NSString *newVersion;
    if (request1.responseStatusCode == 200) {
        NSString *responseString = [request1 responseString];
        
        NSMutableDictionary *responseDict = [responseString JSONValue];
       
        responseDict = [responseDict objectForKey:@"ios"];
        
        newVersion = [responseDict objectForKey:@"version"];
        
        NSInteger build = [[responseDict objectForKey:@"build"] integerValue];
        
        updatePath =  [responseDict objectForKey:@"path"];
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
        
        //NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        // app build版本
        NSInteger app_build = [[infoDictionary objectForKey:@"CFBundleVersion"] integerValue];
        
        
        // NSString *msg = [NSString stringWithFormat:@"发现新版本V，是否立即升级新版本？",app_Version,newVersion];
        
        if (build > app_build) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"系统提示" message:@"检测到新版本,请立即升级!" delegate:self cancelButtonTitle:@"立即升级" otherButtonTitles:nil, nil];
            alert.tag = 1;
            [alert show];
            return;
        }
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        //软件需要更新提醒
        //  if (buttonIndex == 1) {
        
        //            NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
        //            NSDictionary * dict = [defs dictionaryRepresentation];
        //            for (id key in dict) {
        //                [defs removeObjectForKey:key];
        //            }
        //            [defs synchronize];
        
        // NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/wan-zhuan-quan-cheng/id%i?mt=8",iFeverAPPID]];
        
        NSURL *url = [NSURL URLWithString:updatePath];
        
        [[UIApplication sharedApplication] openURL:url];
        
        
        //  }
    }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [MobClick startWithAppkey:@"582c4ef63eae257b5a00005e" reportPolicy:BATCH   channelId:@"Web"];
    
    
    [self checkVersion];
    
    [self configureAPIKey];
    
    [self initSystem];
    
    return YES;
}

- (void) initSystem{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    self.window.rootViewController = [[TabBarController alloc]init];
    
     
    [self.window makeKeyAndVisible];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
