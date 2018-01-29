//
//  XIBTableViewCell.m
//  OCAutoCellHeight
//
//  Created by WhatsXie on 2018/1/29.
//  Copyright © 2018年 StevenXie. All rights reserved.
//

#import "XIBTableViewCell.h"

@implementation XIBTableViewCell
//@synthesize model = _model;
/*
 * CALayer离屏渲染终极解决方案(OC版):
 * 当视图内容是静态不变时，设置 shouldRasterize(光栅化)为YES，此方案最为实用方便。
 view.layer.shouldRasterize = true
 view.layer.rasterizationScale = view.layer.contentsScale
 */

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - getter/setter
//- (Model *)model {
//    return _model;
//}
- (void)setModel:(Model *)model {
    self.labeltitle.text = model.title;
    self.pictureView.image = [UIImage imageNamed:model.picture];
    self.labelContont.text = model.label;
    _model = model;
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

@end
