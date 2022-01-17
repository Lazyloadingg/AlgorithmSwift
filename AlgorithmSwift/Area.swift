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

//        求任意两个矩阵的重叠部分面积
        let rect1 = CGRect.init(x: 10, y: 10, width: 20, height: 180);
        let rect2 = CGRect.init(x: 20, y: 20, width: 100, height: 140);
        
        print("重叠面积：\(area(rect1: rect1, rect2: rect2))");
        
    }
    
    func area(rect1 :CGRect,rect2 :CGRect) -> CGFloat {
        
        let startX = min(rect1.origin.x, rect2.origin.x);
        let endX = max(rect1.origin.x + rect1.size.width, rect2.origin.x + rect2.size.width);
        let width = rect1.size.width + rect2.size.width - (endX - startX);
        
        let startY = min(rect1.origin.y, rect2.origin.y);
        let endY = max(rect1.origin.y + rect1.size.height, rect2.origin.y + rect2.size.height);
        let height = rect1.size.height + rect2.size.height - (endY - startY);
        
        if ((width <= 0) || (height <= 0)){
            return 0;
        }
        return width * height;
    }
}
