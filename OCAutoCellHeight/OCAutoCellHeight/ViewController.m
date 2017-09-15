//
//  ViewController.m
//  OCAutoCellHeight
//
//  Created by WhatsXie on 2017/9/14.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
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
    
    //数据
    
    self.arrayList = @[@[@"Logo", @"Workplace"], @[@"Watermark"]];

    self.titleDic = @{
                       @"Logo":@"GAVTH is a design & development studio.",
                       @"Workplace":@"Definition of GAVTH in old language is deep pit. The logotype, in fact, composed exclusively of contour and curved lines that inspired from topographic lines. The choice of the color is not random; blue is a represent the figure of depth and clean, gray is an earth surface color and it gives neutrality and quiet.",
                       @"Watermark":@"Definition of GAVTH in old language is deep pit. The logotype, in fact, composed exclusively of contour and curved lines that inspired from topographic lines."
                       };
    self.picDic = @{
                     @"Logo":@"Icon.png",
                     @"Workplace":@"PicImg.png",
                     @"Watermark":@"PicText.png"
                     };

    [self tableView];
}
- (void)openDetailView:(NSString *)type {
    [self.navigationController pushViewController:[NSClassFromString(type) new] animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.arrayList objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *titleKey = self.arrayList[indexPath.section][indexPath.row];
    [self openDetailView:titleKey];
}

//懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:_tableView];
        
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
