//
//  XIBTableViewCell.h
//  OCAutoCellHeight
//
//  Created by WhatsXie on 2018/1/29.
//  Copyright © 2018年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface XIBTableViewCell : UITableViewCell

@property (nonatomic, strong) Model *model;

@property (weak, nonatomic) IBOutlet UILabel *labeltitle;//标题
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;//大图
@property (weak, nonatomic) IBOutlet UILabel *labelContont;//内容

- (void)setModel:(Model *)model;
@end
