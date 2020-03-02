//
//  SHJSEvaluateViewController.m
//  SHDemo
//
//  Created by yzq on 2020/3/2.
//  Copyright © 2020 yzq. All rights reserved.
//

#import "SHJSEvaluateViewController.h"
#import <WebKit/WebKit.h>

@interface SHJSEvaluateViewController ()

@property (strong, nonatomic) WKWebView *webview;

@end

@implementation SHJSEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webview = [[WKWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.webview loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
    [self.view addSubview:self.webview];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 50)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"执行" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickToEvaluate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btnCheck = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 100, 50)];
    btnCheck.backgroundColor = [UIColor orangeColor];
    [btnCheck setTitle:@"检查" forState:UIControlStateNormal];
    [btnCheck addTarget:self action:@selector(clickToCheck:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnCheck];
}

#pragma mark - Action

- (void)clickToEvaluate:(UIButton *)sender
{
    //执行顺序为done, 123, handler, 456
    [self.webview evaluateJavaScript:@"console.log('123');setTimeout(() => {console.log('456')}, 30000);" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        NSLog(@"handler");
    }];
    NSLog(@"done");
    sleep(5);
}

- (void)clickToCheck:(UIButton *)sender
{
    //死锁
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [self.webview evaluateJavaScript:@"console.log('123')" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        dispatch_semaphore_signal(semaphore);
    }];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"死锁了");
}

@end
