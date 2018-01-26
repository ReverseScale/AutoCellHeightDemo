//
//  AutoMHTableViewCell.m
//  OCAutoCellHeight
//
//  Created by WhatsXie on 2017/9/14.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "AutoMHTableViewCell.h"
#import <Masonry.h>

@implementation AutoMHTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    //标题 【重点】必须在创建第一块控件的时候约束：contentView
    self.labeltitle = [UILabel new];
    self.labeltitle.backgroundColor = [UIColor whiteColor];
    self.labeltitle.text = @"标题";
    self.labeltitle.font = [UIFont systemFontOfSize:24.];
    self.labeltitle.textAlignment = NSTextAlignmentLeft;
    self.labeltitle.numberOfLines = 0;
    [self.contentView addSubview:_labeltitle];
    
    //大图
    self.pictureView = [UIImageView new];
    self.pictureView.contentMode = UIViewContentModeScaleAspectFill;
    self.pictureView.clipsToBounds = YES;
    [self.contentView addSubview:_pictureView];
    
    //内容
    self.labelContont = [UILabel new];
    self.labelContont.backgroundColor = [UIColor whiteColor];
    self.labelContont.textColor = [UIColor grayColor];
    self.labelContont.text = @"内容";
    self.labelContont.font = [UIFont systemFontOfSize:16.];
    self.labelContont.textAlignment = NSTextAlignmentLeft;
    self.labelContont.numberOfLines = 0;
    self.labelContont.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actionbutton)];
    [self.labelContont addGestureRecognizer:tap];
    [self.contentView addSubview:_labelContont];
    
    [self.labeltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.left.equalTo(self.contentView).with.offset(10);
        make.right.equalTo(self.contentView).with.offset(-10);
    }];
    
    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labeltitle.mas_bottom).with.offset(20);
    }];
    
    [self.labelContont mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pictureView.mas_bottom).with.offset(20);
        make.left.equalTo(self.contentView).with.offset(10);
        make.bottom.equalTo(self.contentView).with.offset(-10);
    }];
//    [self updateConstraints];
}

//- (void)updateConstraints {
//    [self.labeltitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentView.mas_top).with.offset(15);
//        make.left.equalTo(self.contentView).with.offset(10);
//        make.right.equalTo(self.contentView).with.offset(-10);
//    }];
//
//    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.labeltitle.mas_bottom).with.offset(20);
//    }];
//
//    [self.labelContont mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.pictureView.mas_bottom).with.offset(20);
//        make.left.equalTo(self.contentView).with.offset(10);
//        make.bottom.equalTo(self.contentView).with.offset(-10);
//    }];
//
//    [super updateConstraints];
//}

- (void)Actionbutton{
    NSLog(@"点击了内容");
}

@end
