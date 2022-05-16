//
//  RainWater.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/5/15.
//

import UIKit

class RainWater: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        接雨水
        //    https://leetcode.cn/problems/trapping-rain-water/
        
        let test1 = [0,1,0,2,1,0,1,3,2,1,2,1];
        let test2 = [4,2,0,3,2,5];
        print(trap(test1));
        print(trap(test2));
        
    }
    //暴力
    func trap1(_ height : [Int]) -> Int {
        var aes = 0;
        
        return aes;
    }
    
    //    双指针
    func trap(_ height : [Int]) -> Int {
        var aes = 0;
        var left = 0;
        var right = height.count - 1;
        var leftMax = 0;
        var rightMax = 0;
        
        while left < right {
            
            if height[left] < height[right] {
                
                if height[left] >= leftMax{
                    leftMax =  height[left];
                }else{
                    aes += leftMax - height[left];
                }
                left += 1
            }else{
                if height[right] >= rightMax {
                    rightMax = height[right];
                }else{
                    aes += rightMax - height[right];
                }
                right -= 1;
            }
        }
        
        return aes;
    }
}
