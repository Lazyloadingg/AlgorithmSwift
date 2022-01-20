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
        let arr1 = [3,4,2,0,0,1];
        print(test(n: arr));
        print(test(n: arr1));
        
    }
    
    //双重遍历
    func test(n:[Int]) -> Int {
        var index = 0;
        while index<n.count {
            let temp = n[index];
            for i in index+1..<n.count {
                if temp ==  n[i] {
                    return temp;
                }
            }
            index += 1;
        }
        return 0;
    }
    //
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var s = Set<Int>();
        for n in nums {
            if s.contains(n) {
                return n;
            }
            s.insert(n);
        }
        return -1;
    }
}
