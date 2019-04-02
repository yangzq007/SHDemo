//
//  SHOnePixelViewController.m
//  SHDemo
//
//  Created by yzq on 2019/4/2.
//  Copyright © 2019 yzq. All rights reserved.
//

#import "SHOnePixelViewController.h"

#import "SHOnePixelCell.h"
#import <Masonry/Masonry.h>

static CGFloat const kItemWidth = 66.0f;
static CGFloat const kItemHeight = 63.f;
static NSInteger const kItemCount = 4;

/**
 请分别在iPhone 8和iPhone X上跑查看差异
 */
@interface SHOnePixelViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionView *wCollectionView;
@property (assign, nonatomic) CGFloat interitemSpacing;

@end

@implementation SHOnePixelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self initContent];
    
    [self initConstraints];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SHOnePixelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SHOnePixelCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - Init

- (void)initData
{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    self.interitemSpacing = (screenWidth - kItemWidth * kItemCount) / (kItemCount + 1);
}

- (void)initContent
{
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.wCollectionView];
}

- (void)initConstraints
{
    self.collectionView.frame = CGRectMake(self.interitemSpacing, 100, [[UIScreen mainScreen] bounds].size.width-self.interitemSpacing*2, kItemHeight);
    
    [_wCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.equalTo(self.view).offset(self.interitemSpacing);
        make.right.equalTo(self.view).offset(-self.interitemSpacing);
        make.height.equalTo(@(kItemHeight));
    }];
}

#pragma mark - GetterAndSetter

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 24;
        layout.minimumInteritemSpacing = self.interitemSpacing;
        layout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];;
        [_collectionView registerClass:[SHOnePixelCell class] forCellWithReuseIdentifier:@"SHOnePixelCell"];
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UICollectionView *)wCollectionView
{
    if (!_wCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 24;
        layout.minimumInteritemSpacing = self.interitemSpacing;
        layout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _wCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _wCollectionView.backgroundColor = [UIColor whiteColor];;
        [_wCollectionView registerClass:[SHOnePixelCell class] forCellWithReuseIdentifier:@"SHOnePixelCell"];
        _wCollectionView.dataSource = self;
    }
    return _wCollectionView;
}

@end
