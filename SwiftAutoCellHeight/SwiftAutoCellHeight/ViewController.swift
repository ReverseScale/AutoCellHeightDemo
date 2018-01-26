//
//  ViewController.swift
//  SwiftAutoCellHeight
//
//  Created by WhatsXie on 2017/9/14.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit

let customcellIdentifier:String = "customcell"

class ViewController: UIViewController {
    var arrayList = NSArray()
    var titleDic = NSDictionary()
    var picDic = NSDictionary()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: UITableViewStyle.grouped)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AutoMHTableViewCell.self , forCellReuseIdentifier: customcellIdentifier)
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        arrangeData()
        self.view.addSubview(tableView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: - Data
    func arrangeData() {
        arrayList = [
            ["Logo","Workplace"],
            ["Watermark"]
        ]
        titleDic = [
            "Logo":"GAVTH is a design & development studio.",
            "Workplace":"Definition of GAVTH in old language is deep pit. The logotype, in fact, composed exclusively of contour and curved lines that inspired from topographic lines. The choice of the color is not random; blue is a represent the figure of depth and clean, gray is an earth surface color and it gives neutrality and quiet.",
            "Watermark":"The choice of the color is not random; blue is a represent the figure of depth and clean, gray is an earth surface color and it gives neutrality and quiet."
        ]
        picDic = [
            "Logo":"Icon.png",
            "Workplace":"PicImg.png",
            "Watermark":"PicText.png"
        ]
    }

    func openDetailView(type:String) {
        let vc:UIViewController = (NSClassFromString("SwiftAutoCellHeight."+type) as! UIViewController.Type).init()
        self.navigationController?.pushViewController(vc, animated: true)
        
        //storyboard 跳转
//        self.performSegue(withIdentifier:type, sender: self)
    }
    
    override func updateViewConstraints() {
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        
        
        super.updateViewConstraints()
    }
}

// MARK:- UITableView的代理方法
//extension：类扩展只能扩充方法，不能扩充属性
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayList[section] as AnyObject).count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:customcellIdentifier) as! AutoMHTableViewCell
        cell.selectionStyle = .none
        
        let titleKey = (arrayList[indexPath.section] as! NSArray)
        let tky = titleKey[indexPath.row]

        cell.labelTitle.text = tky as? String
        cell.imagePhone.image = UIImage(named: self.picDic[tky] as! String)
        cell.labelContronter.text = self.titleDic[tky] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let titleKey = (arrayList[indexPath.section] as! NSArray)
        let tky = titleKey[indexPath.row]
        openDetailView(type: tky as! String)
    }
}
