//
//  ViewController.m
//  OCAutoCellHeight
//
//  Created by WhatsXie on 2017/9/14.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

#import "AutoMHTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *arrayList;
@property (nonatomic, strong) NSDictionary *titleDic;
@property (nonatomic, strong) NSDictionary *picDic;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self arrangeData];
    [self tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data
- (void)arrangeData {
    self.arrayList = @[@[@"Logo", @"Workplace"], @[@"Watermark"]];
    
    self.titleDic = @{@"Logo":@"GAVTH is a design & development studio.",
                      @"Workplace":@"Definition of GAVTH in old language is deep pit. The logotype, in fact, composed exclusively of contour and curved lines that inspired from topographic lines. The choice of the color is not random; blue is a represent the figure of depth and clean, gray is an earth surface color and it gives neutrality and quiet.",
                      @"Watermark":@"The choice of the color is not random; blue is a represent the figure of depth and clean, gray is an earth surface color and it gives neutrality and quiet."
                      };
    self.picDic = @{@"Logo":@"Icon.png",
                    @"Workplace":@"PicImg.png",
                    @"Watermark":@"PicText.png"
                    };
}
    
#pragma mark - Action
- (void)openDetailView:(NSString *)type {
    [self.navigationController pushViewController:[NSClassFromString(type) new] animated:YES];
}
    
#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayList.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.arrayList objectAtIndex:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return [self systemTableView:tableView cellForRowAtIndexPath:indexPath];
    return [self customCodeTableView:tableView cellForRowAtIndexPath:indexPath];
}
    
#pragma mark - View
/// 系统级
- (UITableViewCell *)systemTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"systemcell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"systemcell"];
    }
    cell.textLabel.text = self.titleDic[self.arrayList[indexPath.section][indexPath.row]];
    return cell;
}
/// 纯代码自定义 Cell
- (UITableViewCell *)customCodeTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifierhot = @"cell";
    AutoMHTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifierhot];
    if (!cell){
        cell = [[AutoMHTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierhot];
        /* 忽略点击效果 */
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        NSString *titleKey = self.arrayList[indexPath.section][indexPath.row];
        cell.labeltitle.text = titleKey;
        cell.pictureView.image = [UIImage imageNamed:self.picDic[titleKey]];
        cell.labelContont.text =self.titleDic[titleKey];
    }
    return cell;
}
    
#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *titleKey = self.arrayList[indexPath.section][indexPath.row];
    [self openDetailView:titleKey];
}

#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];

        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:_tableView];
        
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44;
        
        //系统注册
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"systemcell"];
    }
    return _tableView;
}
    
#pragma mark - AutoLayout
- (void)updateViewConstraints {
    if(@available(iOS 11.0,*)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if(@available(iOS 11.0,*)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.size.equalTo(self.view);
            make.center.equalTo(self.view);
        }
    }];
    
    [super updateViewConstraints];
}

@end
