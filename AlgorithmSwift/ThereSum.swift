//
//  ThereSum.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/24.
//

import UIKit

class ThereSum: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // https://leetcode-cn.com/problems/3sum/
        let arr = [-5,-2,0,-7,3,1,2,5,123,56,0,4,19];
        let arr1 = [-1, 0, 1, 2, -1, -4];
        
        print(threeSum(nums: arr1, target: 0));
        print(threeSum(nums: arr, target: 8));
        
    }
    
    func threeSum(nums:[Int],target : Int) -> [Any] {
        
        
        /**   本地是两数之和的扩展，不过更复杂一点，我们可以固定一个数然后去查找另外两个数，但这样太麻烦，如果我们把数组变成有序的，那么我们就可以通过双指针的方式进行查找
         */
        if nums.count < 3 {
            return [];
        }
        let temp = ArraySort();
        //1. 排序数组
        let newArray = temp.insertSort(nums: nums);
        print(newArray);
        var result = [[Any]]();
        
        //2. 遍历数组 固定每一个元素进行查找
        for index in 0..<newArray.count - 3 {
            
            // 3. 如果要固定的元素大于目标值则直接结束循环因为数组已排序，如果当前元素大于目标值，那么他后边的元素也必定大于目标值，这样三数之和就永远不会等于目标值
            if newArray[index] > target {
                break;
            }
            //4. 去重操作，如果当前元素和前一个元素相等，则跳过，直接开始下一次循环
            if index > 0 &&  newArray[index] == newArray[index - 1] {
                continue;
            }
            
            //5. 双指针查找从当前的下一个元素和最后一个元素开始
            var left = index+1;
            var right = newArray.count - 1;
            
            while left < right {
                
                let sum = newArray[index] + newArray[left] + newArray[right];
                if  sum == target {
                    //6. 如果三数之和与目标值相等，则记录这组数字
                    result.append([newArray[index],newArray[left],newArray[right]]);
                    //                    while left < right && newArray[left] == newArray[left+1] {
                    //                        left += 1;
                    //                    }
                    //                    while left < right && newArray[right] == newArray[right-1] {
                    //                        right -= 1;
                    //                    }
                    
                    //7. 继续移动指针计算
                    right -= 1;
                    left += 1;
                }else if(sum > target){
                    //8. 因为是已经排序的数组，左侧数字一定小于等于右侧数字，那么如果和大于目标值，则向左移动右指针，新的和就会比原来的和更接近目标值
                    right -= 1;
                }else{
                    //9. 因为是已经排序的数组，左侧数字一定小于等于右侧数字，那么如果和小于目标值，则向右移动左指针，新的和就会比原来的和更接近目标值
                    left += 1;
                }
            }
        }
        return result;
    }
    
}
