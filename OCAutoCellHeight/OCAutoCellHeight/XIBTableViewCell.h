//
//  XIBTableViewCell.h
//  OCAutoCellHeight
//
//  Created by WhatsXie on 2018/1/29.
//  Copyright © 2018年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XIBTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labeltitle;//标题
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;//大图
@property (weak, nonatomic) IBOutlet UILabel *labelContont;//内容

@end
