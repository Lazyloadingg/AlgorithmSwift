//
//  Cumsum.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/6/28.
//

import UIKit

class Cumsum: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arr = [2,5,1,10,29,6,22,8,-2,9,4];
        print(cumsum(nums: arr, left: 3, right: 7));
        print(cumsum1(nums: arr, left: 3, right: 7));
    }
    
    //MARK: 遍历法
    func cumsum(nums:[Int],left : Int,right : Int) -> Int {
        let new = Array(nums[left...right]);
        var sum = 0;
        for index in 0..<new.count {
            sum += new[index];
        }
        return sum;
    }
    
    //MARK: 前置数组法
    func cumsum1(nums:[Int],left : Int,right : Int) -> Int {
        
        //用一个数组存放从0累加到指定位置的和，下次查询可以直接取值不用计算
        var sumArray = Array.init(repeating: 0, count: nums.count);
        var sum = 0;
        for index in 0..<nums.count {
            sum += nums[index];
            sumArray[index] = sum;
        }
        return sumArray[right] - sumArray[left - 1];
    }
}
