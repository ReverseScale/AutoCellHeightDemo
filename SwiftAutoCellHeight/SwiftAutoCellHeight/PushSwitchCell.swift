//
//  PushSwitchCell.swift
//  SwiftAutoCellHeight
//
//  Created by Steven Xie on 2018/8/14.
//  Copyright © 2018年 StevenXie. All rights reserved.
//

import UIKit

class PushSwitchCell: UITableViewCell {
    
    typealias swiftBlock = (_ str: String) -> Void
    
    var callBack : swiftBlock?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeSwitch: UISwitch!
    @IBOutlet weak var showedButton: UIButton!
    
    @IBOutlet weak var selectTimeBottomView: UIView!
    @IBOutlet weak var selectTimeBottomHeightConstraint: NSLayoutConstraint!
    
    var model = PushInfoModel() {
        didSet{
            titleLabel.text = model.pushTitle
            typeSwitch.isOn = model.pushType
            
            if model.pushTip == "ExpandAble" && model.pushType {
                isSelectTime = true
            } else {
                isSelectTime = false
            }
            
            if model.pushTip == "InfoAble" {
                showedButton.isHidden = false
            } else {
                showedButton.isHidden = true
            }
            
            if model.pushTip == "PushAble" {
                accessoryType = .disclosureIndicator
                typeSwitch.isHidden = true
            } else {
                accessoryType = .none
                typeSwitch.isHidden = false
            }
        }
    }
    
    var isSelectTime:Bool = false {
        didSet {
            selectTimeBottomView.isHidden = !isSelectTime
            selectTimeBottomHeightConstraint.constant = isSelectTime ? 120.0 : 0.0
        }
    }
    
    @IBAction func typeSwitchAction(_ sender: Any) {
        print(model.pushKey)
        UserDefaults.standard.set(typeSwitch.isOn, forKey: model.pushKey)
        
        if callBack != nil {
            callBack!("")
        }
    }
    
    func callBackBlock(_ block: @escaping (_ str: String) -> Void) {
        callBack = block
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
