//
//  AutoMHTableViewCell.swift
//  SwiftAutoCellHeight
//
//  Created by WhatsXie on 2017/9/14.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit
import SnapKit

class AutoMHTableViewCell: UITableViewCell {
    //标题
    let labelTitle = UILabel()
    //图片
    let imagePhone = UIImageView()
    //内容
    let labelContronter = UILabel()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //创建UI
        self.InitUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //frame
    }
    
    
    fileprivate func InitUI(){
        labelTitle.numberOfLines = 0
        labelTitle.backgroundColor = UIColor.white
        labelTitle.font = UIFont.systemFont(ofSize: 24)
        contentView.addSubview(labelTitle)

        imagePhone.contentMode = .scaleAspectFill
        imagePhone.clipsToBounds = true
        contentView.addSubview(imagePhone)
        
        labelContronter.numberOfLines = 0
        labelContronter.textColor = UIColor.gray
        labelContronter.font = UIFont.systemFont(ofSize: 16)
        labelContronter.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(Actionbuton))
        labelContronter.addGestureRecognizer(tapGesture)
        contentView.addSubview(labelContronter)
    }
    
    override func updateConstraints() {
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        imagePhone.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(20)
        }
        labelContronter.snp.makeConstraints { (make) in
            make.top.equalTo(imagePhone.snp.bottom).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(contentView).offset(-20)
        }
        super.updateConstraints()
    }
    func Actionbuton() {
        print("点击了label")
    }
}
