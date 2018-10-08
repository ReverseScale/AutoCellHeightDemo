//
//  XIBTableViewCell.swift
//  SwiftAutoCellHeight
//
//  Created by WhatsXie on 2018/1/29.
//  Copyright © 2018年 StevenXie. All rights reserved.
//

import UIKit

class NewsBigPictrueCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imagePhone: UIImageView!
    @IBOutlet weak var labelContronter: UILabel!
    
    var model = Model() {
        didSet{
            labelTitle.text = model.title
            imagePhone.image = UIImage(named: model.picture!)
            labelContronter.text = model.label
        }
    }

    /*
     * CALayer离屏渲染终极解决方案(OC版):
     * 当视图内容是静态不变时，设置 shouldRasterize(光栅化)为YES，此方案最为实用方便。
     view.layer.shouldRasterize = YES;
     view.layer.rasterizationScale = view.layer.contentsScale;
     */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
