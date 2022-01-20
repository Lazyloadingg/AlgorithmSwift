//
//  SameNum.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/20.
//

import UIKit

class SameNum: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/
        //    找出任意一个重复的数字
        let arr = [7,1,5,2,3,5,7,8];
        
        print(test(n: arr));
        
    }
    
    func test(n:[Int]) -> Int {
        var index = 0;
        //        双重遍历
        while index<n.count {
            let temp = n[index];
            for num in index+1..<n.count {
                if temp == num {
                    return temp;
                }
            }
            index += 1;
        }
        return 0;
    }
    
    
}
