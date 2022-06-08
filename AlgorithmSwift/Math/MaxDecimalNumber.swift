//
//  MaxDecimalNumber.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/15.
//

import UIKit

class MaxDecimalNumber: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //打印从1到 n位最大十进制数 的数字
        print(test(2));
        
    }
    
    func test(_ n : Int) {
        var el = 1;
        for _ in 0..<n {
            el *= 10;
        }
        
        for index in 1..<el  {
            print(index);
        }
    }
}
