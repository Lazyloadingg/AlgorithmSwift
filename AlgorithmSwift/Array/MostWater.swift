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
        print("成水量：\(maxArea(test))");
    }
    //MARK: 回忆方法
    func maxArea(_ height: [Int]) -> Int  {
        if height.count <= 1 {
            return 0;
        }
        var res = 0;
        var left = 0;
        var right = height.count - 1;
        while left < right {
            let l = height[left];
            let r = height[right];
            res = max(res, (right - left) * min(l,r));
            if l < r {
                left += 1;
            }else{
                right -= 1;
            }
        }
        return res;
    }
    //MARK: 双指针
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
