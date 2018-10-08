//
//  ViewController.swift
//  SwiftAutoCellHeight
//
//  Created by WhatsXie on 2017/9/14.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit
import SnapKit

let customcellIdentifier:String = "customcell"

class ViewController: UIViewController {
    var listArray = Array<Any>()
    var titleDic = Dictionary<String, String>()
    var typeBoolDic = Dictionary<String, Any>()
    var extendTipDic = Dictionary<String, String>()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        
        reloadArrangeData()
        
        updateViewConstraints()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: - Data
    func reloadArrangeData() {
        
        listArray = UserDefaults.standard.bool(forKey: "AllPush")
            ? [
                ["AllPush", "MutePush"],
                ["NewsPush", "FlashPush", "MarketPush"],
                ["AuthorPush"],
              ]
            : [
                ["AllPush"],
              ]

        titleDic = [
            "AllPush":"接收新消息通知",
            "MutePush":"免打扰",
            "NewsPush":"文章消息通知",
            "FlashPush":"块讯消息通知",
            "MarketPush":"行情消息通知",
            "AuthorPush":"关注作者更新通知",
        ]
        typeBoolDic = [
            "AllPush":UserDefaults.standard.bool(forKey: "AllPush"),
            "MutePush":UserDefaults.standard.bool(forKey: "MutePush"),
            "NewsPush":UserDefaults.standard.bool(forKey: "NewsPush"),
            "FlashPush":UserDefaults.standard.bool(forKey: "FlashPush"),
            "MarketPush":UserDefaults.standard.bool(forKey: "MarketPush"),
            "AuthorPush":UserDefaults.standard.bool(forKey: "AuthorPush"),
            ]
        extendTipDic = [
            "AllPush":"",
            "MutePush":"ExpandAble",
            "NewsPush":"InfoAble",
            "FlashPush":"InfoAble",
            "MarketPush":"InfoAble",
            "AuthorPush":"PushAble",
        ]
        tableView.reloadData()
    }
    
    override func updateViewConstraints() {
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        self.tableView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide)
                make.left.right.equalTo(self.view)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            } else {
                make.size.equalTo(self.view)
                make.center.equalTo(self.view)
            }}
        
        super.updateViewConstraints()
    }
}

// MARK:- UITableView的代理方法
//extension：类扩展只能扩充方法，不能扩充属性
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    //DataSource
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 0.01))
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 0.01))
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listArray[section] as AnyObject).count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.customXIBSwitchView(tableView, cellForRowAt: indexPath)
    }
    //Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let titleKey = (arrayList[indexPath.section] as! NSArray)
//        let tky = titleKey[indexPath.row]
//        openDetailView(type: tky as! String)
    }
}
extension ViewController {

    
    func customXIBSwitchView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifierhot = "PushSwitchCell"
        
        //重用写法
        var cell = tableView.dequeueReusableCell(withIdentifier: identifierhot) as? PushSwitchCell
        if cell == nil {
            tableView.register(UINib(nibName: identifierhot, bundle: nil), forCellReuseIdentifier: identifierhot)
            cell = tableView.dequeueReusableCell(withIdentifier: identifierhot) as? PushSwitchCell
            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        }

        let modelkey = (listArray[indexPath.section] as! Array<Any>)[indexPath.row] as! String

        let modelPushInfo = PushInfoModel()
        modelPushInfo.pushKey = modelkey
        modelPushInfo.pushTitle = titleDic[modelkey]!
        modelPushInfo.pushType = typeBoolDic[modelkey] as! Bool
        modelPushInfo.pushTip = extendTipDic[modelkey]!
        cell?.model = modelPushInfo
        
        cell?.selectionStyle = .none
        cell?.callBackBlock({ (string) in
            self.reloadArrangeData()
        })
        
        return cell!
    }

}
