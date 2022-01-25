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
        var sets = Set<Int>();
        for _ in 0..<100 {
            sets.insert(Int(arc4random_uniform(1000)));
        }
        let arr = sets.map {  $0};
        print(insertSort(nums: arr));
        print(bubblingSort(nums: arr));
        print(setsorted(nums: sets));
        
    }
    

    //系统函数sort
    func setsorted(nums:Set<Int>) -> [Int] {
        
        let startTime = CFAbsoluteTimeGetCurrent()
        let newArr = nums.sorted();
        let endTime = CFAbsoluteTimeGetCurrent()
        debugPrint("\(#function) 耗时：%f 毫秒", (endTime - startTime)*1000)
        return newArr;
    }
    
    //插入
    func insertSort(nums:[Int]) ->  [Int]{
        let startTime = CFAbsoluteTimeGetCurrent()
        
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
    //冒泡
    func bubblingSort(nums:[Int]) ->  [Int]{
        let startTime = CFAbsoluteTimeGetCurrent()

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
    
    func xier(nums:[Int]) -> [Int] {
        
        var newArr = nums;
        
        var gap = newArr.count / 2;
        
        if gap > 0 {
            
        }
        
        
        return newArr;
    }
    
    
}
