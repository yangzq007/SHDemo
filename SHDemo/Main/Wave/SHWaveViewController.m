//
//  SHWaveViewController.m
//  SHDemo
//
//  Created by yzq on 2017/8/14.
//  Copyright © 2017年 yzq. All rights reserved.
//

#import "SHWaveViewController.h"

#import "SHWaveView.h"

@interface SHWaveViewController ()

@property (strong, nonatomic) SHWaveView *waveView;

@end

@implementation SHWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initContent];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_waveView startWave];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init

- (void)initContent
{
    _waveView = [[SHWaveView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:_waveView];
}

@end
