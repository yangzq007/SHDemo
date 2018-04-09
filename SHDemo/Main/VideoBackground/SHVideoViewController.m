//
//  SHVideoViewController.m
//  SHDemo
//
//  Created by yzq on 2018/4/9.
//  Copyright © 2018年 yzq. All rights reserved.
//

#import "SHVideoViewController.h"

#import <AVFoundation/AVFoundation.h>
#import "SHColorLibrary.h"

@interface SHVideoViewController ()

@property (nonatomic, strong) AVPlayer *mPlayer;
@property (nonatomic, strong) UIButton *mBtnBack;

@end

@implementation SHVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initVideoBackground];
    
    [self initContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Action

- (void)clickToDismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Notification

- (void)videoDidReachEnd:(id)sender
{
    [_mPlayer seekToTime:kCMTimeZero];
    [_mPlayer play];
}

#pragma mark - Init

- (void)initVideoBackground
{
    CGFloat windowWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat windowHeight = [UIScreen mainScreen].bounds.size.height;
    
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"water" ofType:@"mp4"];
    
    _mPlayer = [[AVPlayer alloc] initWithURL:[NSURL fileURLWithPath:videoPath]];
    AVPlayerLayer *avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:_mPlayer];
    [avPlayerLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [avPlayerLayer setFrame:CGRectMake(0, 0, windowWidth, windowHeight)];
    [self.view.layer addSublayer:avPlayerLayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[_mPlayer currentItem]];
    
    [_mPlayer seekToTime:kCMTimeZero];
    [_mPlayer play];
    [_mPlayer setActionAtItemEnd:AVPlayerActionAtItemEndNone];
}

- (void)initContent
{
    [self.view addSubview:self.mBtnBack];
}

#pragma mark - GetterAndSetter

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


@end
