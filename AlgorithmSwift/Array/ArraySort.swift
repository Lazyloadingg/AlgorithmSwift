//
//  ArraySort.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/25.
//

import UIKit

class ArraySort: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //数组排序
        var sets = [Int]();
        let count = 20;
        for _ in 0..<count {
            sets.append(Int(arc4random_uniform(UInt32(count))))
        }
        
        let arr = sets.map {  $0};
        print("原始数组：\(arr)\n");
        print(insertSort(nums: arr));
        print("\n");
        print(bubblingSort(nums: arr));
        print("\n");
//        print(setsorted(nums: sets));
        print("\n");
        print(shell(nums: arr));
        print("\n");
        print("选择\(selectSort(nums: arr))");
        
        /**
         多次测试后
         
         数据量  插入  冒泡  sort  希尔
         10000：759.7ms  11998.8ms  26.2ms  47.8ms
         1000：13ms  118ms  2.27ms  3.18ms
         100：0.42ms  4.16ms  0.65ms  0.42ms
         10：0.02ms  0.04ms  0.08ms  0.01ms
         */
        
    }
    

    //系统函数sort
    func setsorted(nums:Set<Int>) -> [Int] {
        
        let startTime = CFAbsoluteTimeGetCurrent()
        let newArr = nums.sorted();
        let endTime = CFAbsoluteTimeGetCurrent()
        debugPrint("\(#function) 耗时：%f 毫秒", (endTime - startTime)*1000)
        return newArr;
    }
    
    //MARK: 选择
    func selectSort(nums: [Int]) -> [Int]{
        let startTime = CFAbsoluteTimeGetCurrent()
        if nums.count < 2 {
            return nums;
        }
        
        var new = nums;
        for index in 0..<new.count {
            var minIndex = index;
            for index1 in (index+1)..<new.count {
                minIndex = new[index1] < new[minIndex] ? index1 : minIndex;
            }
            swapArray(nums: &new, i: index, j: minIndex);
        }
        let endTime = CFAbsoluteTimeGetCurrent()
        debugPrint("\(#function) 耗时：%f 毫秒", (endTime - startTime)*1000)
        return new;
    }
    
    //MARK: 交换位置方法
    func swapArray(nums : inout [Int],i : Int,j : Int)  {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }
    
    //MARK: 插入
    func insertSort(nums:[Int]) ->  [Int]{
        let startTime = CFAbsoluteTimeGetCurrent()
        
        /**
         1. 插入排序思想是比较相邻两个数字并交换位置，交换后，可以确定数组的部分已经排序，
         2. 继续取未排序部分元素执行上述操作，数组已排序部分不断的增加元素，直到整个数组排序完成
         插入排序和冒泡排序的区别就是 插入排序是和已经有序的部分进行比较，冒泡排序是和未排序的所有部分进行比较
         */
        if nums.count < 2 {
            return nums;
        }
        
        var newArr = nums;
        
        for index in 1..<newArr.count {
            var target = index;
            while target > 0 {
                if newArr[target] < newArr[target - 1] {
                    let temp = newArr[target-1];
                    newArr[target-1] = newArr[target];
                    newArr[target] = temp;
                    target -= 1;
                }else{
                    break;
                }
            }
        }
        
        let endTime = CFAbsoluteTimeGetCurrent()
        debugPrint("\(#function) 耗时：%f 毫秒", (endTime - startTime)*1000)
        return newArr;
    }
    
    //MARK: 冒泡
    func bubblingSort(nums:[Int]) ->  [Int]{
        let startTime = CFAbsoluteTimeGetCurrent()

        /**
         1. 冒泡排序是不断比较相邻的两个元素，然后交换位置，直到比较完其他元素此时确定一个元素的位置
         2. 遍历数组对每一个元素进行上述操作，此时就确定了每一个元素的位置
         */
        var temp = nums;
        
        for first in 0..<temp.count - 1 {
            for index in 0..<temp.count - 1 - first {
                
                if temp[index] > temp[index + 1] {
                    let left = temp[index+1];
                    temp[index+1] = temp[index]
                    temp[index] = left;
                }
            }
        }
        let endTime = CFAbsoluteTimeGetCurrent()
        debugPrint("\(#function) 耗时：%f 毫秒", (endTime - startTime)*1000)
        return temp;
    }
    
    //MARK: 希尔
    func shell(nums:[Int]) -> [Int] {
        if nums.count < 2 {
            return nums;
        }
        let startTime = CFAbsoluteTimeGetCurrent()

        
        /**
         1. 希尔排序就是优化的插入排序
         2. 将要排序的序列通过固定的间隔分隔成多个子序列 对子序列进行插入排序
         3. 然后缩小间隔重复第二步的操作，直到间隔为1 这是就和普通的插入排序相同了
         插入排序遇到原数组与目标数组排序差异较大时比较次数过多，希尔排序通过先将整个排序数组整体分割的方式 将数组先排成一个相对较整齐的数组，来达到减少比较和移动元素的效果从而提高效率
         */
        
        var newArr = nums;
        var gap = newArr.count / 2;
        
        //1: 外层循环代表拆分几次数组
        while gap > 0 {
            //2: 此处遍历从gap开始的原因是，以gap为固定间隔拆分数组，那么第一个元素的位置就是从0开始偏移gap位
            for index in gap..<newArr.count {
                var current = index;
                //3. 用当前元素和之前前边元素进行比较，交换
                while current >= gap {
                    if newArr[current] < newArr[current-gap] {
                        let temp = newArr[current-gap];
                        newArr[current-gap] = newArr[current];
                        newArr[current] = temp
                        current -= gap;
                    }else{
                        break;
                    }
                }
            }
            gap /= 2;
        }
        let endTime = CFAbsoluteTimeGetCurrent()
        debugPrint("\(#function) 耗时：%f 毫秒", (endTime - startTime)*1000)
        return newArr;
    }
   
    
}
