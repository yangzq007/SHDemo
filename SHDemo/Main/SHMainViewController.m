//
//  SHMainViewController.m
//  SHDemo
//
//  Created by yzq on 2017/8/14.
//  Copyright © 2017年 yzq. All rights reserved.
//

#import "SHMainViewController.h"

@interface SHMainViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *mTableView;
@property (strong, nonatomic) NSArray *arrContent;

@end

@implementation SHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self initNav];
    
    [self initContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrContent count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [[_arrContent objectAtIndex:indexPath.row] valueForKey:@"title"];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class class = NSClassFromString([[_arrContent objectAtIndex:indexPath.row] valueForKey:@"vc"]);
    UIViewController *vc = [[class alloc] init];
    vc.navigationItem.title = [[_arrContent objectAtIndex:indexPath.row] valueForKey:@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Init

- (void)initData
{
    _arrContent = @[
                    @{@"title":@"视频背景",@"vc":@"SHVideoBackgroundViewController"},
                    @{@"title":@"水波动画",@"vc":@"SHWaveViewController"}
                    ];
}

- (void)initNav
{
    self.navigationItem.title = @"SHDemo";
}

- (void)initContent
{
    _mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, sc_screenSize.width, sc_screenSize.height) style:UITableViewStylePlain];
    _mTableView.dataSource = self;
    _mTableView.delegate = self;
    [self.view addSubview:_mTableView];
}

@end
