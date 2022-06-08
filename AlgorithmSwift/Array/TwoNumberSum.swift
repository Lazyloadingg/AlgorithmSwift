//
//  TwoNumberSum.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/17.
//

import UIKit

class TwoNumberSum: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //两数之和 https://leetcode-cn.com/classic/problems/two-sum/description/
//        let arr = [2,7,11,5];
        let arr = [3,2,4];
        let target = 6;
        
        print("两数之和：\(method(nums: arr, target: target))");
        print("两数之和：\(method1(nums: arr, target: target))");
        print(twoSumOneHash(nums: arr, target: target));
    }
    
    //暴力遍历法
    func method(nums : Array<Int>,target : Int) -> [Int] {
        var left = 0;
        while left < nums.count {
            for i in (left+1)..<nums.count {
                if((nums[left]+nums[i]) == target){
                    return [left,i];
                }
            }
            left += 1;
        }
        return [];
    }
    
    //
    func method1(nums : Array<Int>,target : Int) ->  [Int]{
        /**这种方法可能会产生疑问，用数组的元素作为map的key，那么数组元素是可以重复的，map的key却不能重复，后放入的岂不是把先放入的覆盖了吗？其实没关系，题目只是问你数组中两个相加等于target的元素的下标，并没有规定重复的元素取数组靠前或者靠后，所以只要符合两数相加登录target这一条即可*/
        var map = [Int:Int]();
        for i in 0 ..< nums.count {
            map[nums[i]] = i;
        }
        
        for i in 0 ..< nums.count {
            let temp = target -  nums[i];
            if(map.keys.contains(temp) && map[temp] != i){
                return [map[temp]!,i];
            }
        }
        return [];
    }
//     一遍哈希表，边存边对比
    public func twoSumOneHash(nums:[Int], target: Int) -> [Int] {
        //这种方法一遍遍历到底一定能有一个结果

        var map = [Int:Int]();
            
        for index in 0..<nums.count {
            let temp = target - nums[index];
            if map.keys.contains(temp) {
                let index1 = map[temp];
                return [index,index1!];
            }
            map[nums[index]] = index;
        }
        return [];
    }

}
