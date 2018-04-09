//
//  SHGifViewController.m
//  SHDemo
//
//  Created by yzq on 2018/4/9.
//  Copyright © 2018年 yzq. All rights reserved.
//

#import "SHGifViewController.h"

#import "SHColorLibrary.h"

@interface SHGifViewController ()

@property (strong, nonatomic) UIWebView *mWebView;
@property (strong, nonatomic) UIButton *mBtnBack;

@end

@implementation SHGifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initWebViewBackground];
    
    [self initContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (void)clickToDismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Init

- (void)initWebViewBackground
{
    [self.view addSubview:self.mWebView];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[self gifName] ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:filePath];
    [self.mWebView loadData:gifData MIMEType:@"image/gif" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
}

- (void)initContent
{
    [self.view addSubview:self.mBtnBack];
}

#pragma mark - GetterAndSetter

- (UIWebView *)mWebView
{
    if (!_mWebView) {
        _mWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, sc_screenSize.width, sc_screenSize.height)];
        
        if (@available(iOS 11.0, *)) {
            _mWebView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _mWebView;
}

- (UIButton *)mBtnBack
{
    if (!_mBtnBack) {
        _mBtnBack = [[UIButton alloc] initWithFrame:CGRectMake((sc_screenSize.width-88)/2, 150, 100, 44)];
        [_mBtnBack setTitle:@"返回" forState:UIControlStateNormal];
        [_mBtnBack setTitleColor:[SHColorLibrary orangeColor] forState:UIControlStateNormal];
        _mBtnBack.layer.cornerRadius = 4.0f;
        _mBtnBack.layer.borderWidth = 0.5;
        _mBtnBack.layer.borderColor = [[SHColorLibrary orangeColor] CGColor];
        [_mBtnBack addTarget:self action:@selector(clickToDismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mBtnBack;
}

#pragma mark - Util

- (NSString *)gifName
{
    if (sc_screenSize.width == 320) {
        return @"railway320";
    }
    
    if (sc_screenSize.width == 375) {
        return @"railway375";
    }
    
    if (sc_screenSize.width == 414) {
        return @"railway414";
    }
    
    return @"railway375";
}

@end
