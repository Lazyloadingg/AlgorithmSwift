//
//  RemoveDuplicates.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/7/14.
//

import UIKit

/// 删除有序数组中的重复项
class RemoveDuplicates: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //这道题有两个版本
        //版本1 https://leetcode.cn/problems/remove-duplicates-from-sorted-array/
        //版本2 https://leetcode.cn/problems/remove-duplicates-from-sorted-array-ii/
        var tmp = [1,1,1,1,2,2,2,3,3,4]
        var tmp1 = [1,1,1,1,2,2,2,3,3,4]
        print(removeDuplicates1(nums: &tmp))
        print(removeDuplicates2(nums: &tmp1))
    }
    
    //MARK: 版本1 双指针
    func removeDuplicates1( nums : inout [Int]) -> Int{
        if nums.count == 0{
            return 0
        }
        //慢指针
        var slow = 0;
        //快指针为index
        for index in 1..<nums.count {
            //如果不相等 慢指针+1，最终不相等次数+1就是有效数组长度
            if nums[slow] != nums[index] {
                //如果快慢指针不相等，就将慢指针下一位赋值为当前元素，此时从0到目前慢指针下标位置，全部元素不重复
                nums[slow + 1] = nums[index]
                //慢指针移动到不重复区间最后一个位置
                slow += 1
            }
        }
        print(nums)
        return slow + 1;
    }
    
    //MARK: 版本2 双指针
    func removeDuplicates2( nums : inout [Int]) -> Int{
        if nums.count < 2{
            return nums.count
        }
        
        //慢指针，有效区间最后一个元素，因为重复元素可出现两次，所以从2开始也就是第三个元素，小于两个元素的无论数组内元素相等不相等都符合条件，因此直接返回
        var slow = 2;
        //index快指针，也从2开始扫描数组每一个元素
        for index in 2..<nums.count {
            //如果当前元素和慢指针位置往前两位的元素不同，
            if nums[slow - 2] != nums[index] {
                //将慢指针位置元素赋值为当前值，
                nums[slow] = nums[index]
                //慢指针后移
                slow += 1
            }
        }
        return slow;
    }
    

}
