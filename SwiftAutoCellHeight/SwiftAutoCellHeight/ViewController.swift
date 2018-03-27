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
        let tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)

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
        
        updateViewConstraints()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: - Data
    func arrangeData() {
        arrayList = [
            ["Logo","Workplace"],
            ["Watermark"],
            ["Logo","Workplace"],
            ["Watermark"],
            ["Logo","Workplace"],
            ["Watermark"]
        ]
        titleDic = [
            "Logo":"GAVTH is a design & development studio.Determined to open the best products and constantly improve the design.",
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayList[section] as AnyObject).count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return self.systemTableView(tableView, cellForRowAt: indexPath)
//        return self.customCodeTableView(tableView, cellForRowAt: indexPath)
        return self.customXIBTableView(tableView, cellForRowAt: indexPath)
    }
    //Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let titleKey = (arrayList[indexPath.section] as! NSArray)
        let tky = titleKey[indexPath.row]
        openDetailView(type: tky as! String)
    }
}
extension ViewController {
    /// 系统级
    func systemTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "systemcell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "systemcell")
        }
        let titleKey = (arrayList[indexPath.section] as! NSArray)
        let tky = titleKey[indexPath.row]
        cell?.textLabel?.text = tky as? String
        return cell ?? UITableViewCell()
    }
    /// 纯代码自定义 Cell
    func customCodeTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:customcellIdentifier) as! AutoMHTableViewCell
        cell.selectionStyle = .none
        
        let titleKey = (arrayList[indexPath.section] as! NSArray)
        let tky = titleKey[indexPath.row]
        
        cell.labelTitle.text = tky as? String
        cell.imagePhone.image = UIImage(named: self.picDic[tky] as! String)
        cell.labelContronter.text = self.titleDic[tky] as? String
        
        cell.setNeedsUpdateConstraints()//系统调用updateConstraints
        cell.updateConstraintsIfNeeded()//立即触发约束更新，自动更新布局
        
        return cell
    }
    /// XIB自定义 Cell
    func customXIBTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifierhot = "XIBTableViewCell"
        
        //重用写法
        var cell = tableView.dequeueReusableCell(withIdentifier: identifierhot) as? XIBTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: identifierhot, bundle: nil), forCellReuseIdentifier: identifierhot)
            cell = tableView.dequeueReusableCell(withIdentifier: identifierhot) as? XIBTableViewCell
            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        }

        // 防止重用写法
//        var cell = tableView.cellForRow(at: indexPath) as? XIBTableViewCell
//        if cell == nil {
//            cell = Bundle.main.loadNibNamed(identifierhot, owner: self, options: nil)?.last as? XIBTableViewCell
//            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
//        }
        
        let titleKey = (arrayList[indexPath.section] as! NSArray)
        let tky = titleKey[indexPath.row]
        
        let modelAlg = Model()
        modelAlg.title = tky as? String
        modelAlg.picture = self.picDic[tky] as? String
        modelAlg.label = self.titleDic[tky] as? String
        
        cell?.model = modelAlg

        
        return cell!
    }
}
