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
        print("双指针----------------------------------------")
        print(trap(test1));
        print(trap(test2));
        print("暴力循环----------------------------------------")
        print(trap1(test1));
        print(trap1(test2));
        print("单调栈----------------------------------------")
        print(trap2(test1));
        print(trap2(test2));
        
    }
    //暴力
    
    //    对撞双指针
    func trap(_ height : [Int]) -> Int {
        
        //看题可知必须两侧高于中间才能存水，并且存水量取决于低的一侧
        //双指针的思路是，固定左侧或者右侧当做锚点，将另一侧想象恒高于左侧或右侧，然后不断用更大的值更新锚点，这样可以计算出每一个位置的垂直存水量，累加即可得出答案
        
        var aes = 0;
        //左指针
        var left = 0;
        //右指针
        var right = height.count - 1;
        //左侧锚点值
        var leftMax = 0;
        //右侧锚点值
        var rightMax = 0;

        while left < right {
            //如果左侧值较小，假设右侧值恒大，从左侧开始移动
            if height[left] < height[right] {
                //如果新的值大于等于左侧锚点值，更新锚点值
                if height[left] >= leftMax{
                    leftMax =  height[left];
                }else{
                    //如果新的值小于锚点值，说明此处为低洼处，锚点值减去低洼处值获得当前垂直雨水量
                    aes += leftMax - height[left];
                }
                //继续移动左指针
                left += 1
            }else{
                //右侧计算逻辑同左侧
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
    //遍历
    func trap1(_ height : [Int]) -> Int {
        if height.count < 2 {
            return 0;
        }
        
        var ans = 0;
        
        for index in 1..<height.count - 1{
            var left = index-1;
            var right = index+1;
            var leftMax = 0;
            var rightMax = 0;
            while left >= 0 {
                leftMax = max(height[left], leftMax);
                left -= 1;
            }
            
            while right < height.count {
                rightMax = max(height[right], rightMax);
                right += 1;
            }
            if height[index] < leftMax && height[index] < rightMax {
                ans += min(leftMax, rightMax) - height[index];
            }
        }
        return ans;
        
    }
    
    //单调递减栈
    func trap2(_ height : [Int]) -> Int {
        if height.count < 2 {
            return 0;
        }
        var stack : [Int] = [Int]();
        var ans = 0;
        //1，for循环将每一个元素入栈
        for index in 0..<height.count {
            
            //2，比较栈顶元素和当前将要入栈的元素，如果当前元素较大，则此元素为低洼处的右侧
            while stack.count > 0 && height[stack.last!] < height[index] {
                //3，取出栈顶元素，这个元素就是低洼可以存水处
                let top = stack.last;
                //4，栈顶元素出栈，出栈后，新的栈顶元素为低洼处的左侧
                stack.removeLast();
                if stack.count == 0 {
                    break;
                }
                //5，比较左右两侧的值，取出较小的那个，因为低洼处存水量取决于较小的一次（木桶原理）
                let min = min(height[index], height[stack.last!]);
                //6，较小值减去低洼处就是存水处的高，右侧索引减去左侧索引就是低洼存水处的宽，之所以再减一是因为我们的索引是从零开始，但是他依然占据一个宽度，所以要额外减一，将每次的结果累加
                ans += (min - height[top!]) * (index - stack.last! - 1)
                //如此循环不断出栈计算
            }
            //不断入栈
            stack.append(index);
        }
        return ans;
    }
    
}
