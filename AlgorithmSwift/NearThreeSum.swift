//
//  NearThreeSum.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/27.
//

import UIKit

class NearThreeSum: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //求哪三个数的和与目标值最接近
        let arr =  [-1,2,1,-4];
        print(test(nums: arr, target: 1));
    }
    
    func test(nums:[Int],target:Int) -> Int {
        
        let newArr = ArraySort().insertSort(nums: nums);
        print(newArr);
        var sub = Int.max;
        for index in 0..<newArr.count - 1 {
            
            var left = index+1;
            var right = newArr.count - 1;

            while left < right {
                let temp = newArr[index] + newArr[left] + newArr[right];
                sub =  min(abs(sub),abs(temp-target))
                if temp - target == 0  {
                    return temp;
                }else if(temp - target > 0){
                    right -= 1;
                }else{
                    left += 1;
                }
            }
        }
        //返回与目标最小的差值与目标值的和就是最接近的三数之和
        return sub + target;
    }

}
