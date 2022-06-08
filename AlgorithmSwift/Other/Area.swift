//
//  Area.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/16.
//

import UIKit

class Area: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //求任意两个矩阵的重叠部分面积
        let rect1 = CGRect.init(x: 10, y: 10, width: 20, height: 180);
        let rect2 = CGRect.init(x: 20, y: 20, width: 100, height: 140);
        
        print("重叠面积：\(area(rect1: rect1, rect2: rect2))");
        
    }
    
    func area(rect1 :CGRect,rect2 :CGRect) -> CGFloat {
        //以左上角为坐标原点为例
        //这个可以脑补画面，移动矩形使两矩形紧贴着但不重叠可以直观的看出来
        //重叠部分的宽，就等于两矩形宽的和，减去两矩形中最大结束点与最小起始点的差
        let startX = min(rect1.origin.x, rect2.origin.x);
        let endX = max(rect1.origin.x + rect1.size.width, rect2.origin.x + rect2.size.width);
        let width = rect1.size.width + rect2.size.width - (endX - startX);
        
        //重叠部分的高，就等于两矩形高的和，减去两矩形中最大结束点与最小起始点的差
        let startY = min(rect1.origin.y, rect2.origin.y);
        let endY = max(rect1.origin.y + rect1.size.height, rect2.origin.y + rect2.size.height);
        let height = rect1.size.height + rect2.size.height - (endY - startY);
        
        //宽和高任意一个小于等于零就说明没有重叠部分
        if ((width <= 0) || (height <= 0)){
            return 0;
        }
        return width * height;
    }
}
