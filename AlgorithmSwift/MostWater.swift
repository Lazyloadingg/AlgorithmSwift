//
//  MostWater.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/17.
//

import UIKit

class MostWater: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //https://leetcode-cn.com/problems/container-with-most-water/
        //求最大盛水量
        let test = [1,8,6,2,5,4,8,3,7];
        print("成水量：\(water(arr: test))");
    }
    
    func water(arr : Array<Int>) -> NSInteger {
        var res = 0;
        var left = 0;
        var right = arr.count - 1;
        while left < right {
            let temp = min(arr[right], arr[left]) * (right - left);
            if(arr[left] < arr[right]){
                left += 1;
            }else{
                right -= 1;
            }
            res = max(res, temp);
        }
        return res;
    }
}
