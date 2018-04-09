//
//  SHVideoBackgroundViewController.m
//  SHDemo
//
//  Created by yzq on 2018/4/9.
//  Copyright © 2018年 yzq. All rights reserved.
//

#import "SHVideoBackgroundViewController.h"

#import "SHGifViewController.h"
#import "SHVideoViewController.h"
#import "SHColorLibrary.h"

@interface SHVideoBackgroundViewController ()

@property (strong, nonatomic) UIButton *mBtnGif;
@property (strong, nonatomic) UIButton *mBtnVideo;

@end

@implementation SHVideoBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (void)clickToGif
{
    SHGifViewController *gifVC = [[SHGifViewController alloc] init];
    [self presentViewController:gifVC animated:YES completion:nil];
}

- (void)clickToVideo
{
    SHVideoViewController *videoVC = [[SHVideoViewController alloc] init];
    [self presentViewController:videoVC animated:YES completion:nil];
}

#pragma mark - Init

- (void)initContent
{
    [self.view addSubview:self.mBtnGif];
    [self.view addSubview:self.mBtnVideo];
}

#pragma mark - GetterAndSetter

- (UIButton *)mBtnGif
{
    if (!_mBtnGif) {
        _mBtnGif = [[UIButton alloc] initWithFrame:CGRectMake((sc_screenSize.width-100)/2, 100, 100, 44)];
        _mBtnGif.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_mBtnGif setTitle:@"Gif方式" forState:UIControlStateNormal];
        [_mBtnGif setTitleColor:[SHColorLibrary orangeColor] forState:UIControlStateNormal];
        [_mBtnGif addTarget:self action:@selector(clickToGif) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mBtnGif;
}

- (UIButton *)mBtnVideo
{
    if (!_mBtnVideo) {
        _mBtnVideo = [[UIButton alloc] initWithFrame:CGRectMake((sc_screenSize.width-100)/2, 188, 100, 44)];
        _mBtnVideo.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_mBtnVideo setTitle:@"Video方式" forState:UIControlStateNormal];
        [_mBtnVideo setTitleColor:[SHColorLibrary orangeColor] forState:UIControlStateNormal];
        [_mBtnVideo addTarget:self action:@selector(clickToVideo) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mBtnVideo;
}

@end
