# AutoCellHeightDemo
OC + Swift 双版本实现动态列表 UITableView 数据加载及 cell 动态高度自适应。

---
![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-791K-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

集中管理 TableView Data ，适用于暂时固定的类表结构，页面跳转由 Runtime 的类方法实现（和 storyboard 动态跳转），适合对列表数据排序变动的情况。

| 名称 |1.列表页 |2.自适应列表页 |3.动态跳转详情页 |
| ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-9-15/30194771.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-9-15/75991299.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-9-15/9655826.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 相对布局纯代码 cell 高度自适应 | 动态数据跳转详情页 |


## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.实现简单，灵活性强
* 3.具备较高自定义性


## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### OC 数据
```
self.arrayList = @[@[@"Logo", @"Workplace"], @[@"Watermark"]];

self.titleDic = @{
                   @"Logo":@"GAVTH is a design & development studio.",
                   @"Workplace":@"Definition of GAVTH in old language is deep pit. The logotype, in fact, composed exclusively of contour and curved lines that inspired from topographic lines. The choice of the color is not random; blue is a represent the figure of depth and clean, gray is an earth surface color and it gives neutrality and quiet.",
                   @"Watermark":@"Definition of GAVTH in old language is deep pit. The logotype, in fact, composed exclusively of contour and curved lines that inspired from topographic lines."
                   };
self.picDic = @{
                 @"Logo":@"Icon.png",
                 @"Workplace":@"PicImg.png",
                 @"Watermark":@"PicText.png"
                 };
```
### Swift 数据
```
arrayList = [
    ["Logo","Workplace"],
    ["Watermark"]
]
titleDic = [
    "Logo":"GAVTH is a design & development studio.",
    "Workplace":"Definition of GAVTH in old language is deep pit. The logotype, in fact, composed exclusively of contour and curved lines that inspired from topographic lines. The choice of the color is not random; blue is a represent the figure of depth and clean, gray is an earth surface color and it gives neutrality and quiet.",
    "Watermark":"Definition of GAVTH in old language is deep pit. The logotype, in fact, composed exclusively of contour and curved lines that inspired from topographic lines."
    ]
picDic = [
    "Logo":"Icon.png",
    "Workplace":"PicImg.png",
    "Watermark":"PicText.png"
    ]
```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
AutoCellHeightDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
