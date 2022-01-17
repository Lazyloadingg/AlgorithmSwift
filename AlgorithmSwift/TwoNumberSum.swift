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
        let arr = [2,7,11,5];
        let target = 16;
        
        print("两数之和：\(method(arr: arr, target: target))");
        print("两数之和：\(method1(arr: arr, target: target))");
    }
    
    //遍历法
    func method(arr : Array<Int>,target : Int) -> (Int,Int) {
        var left = 0;
        while left < arr.count {
            for i in left..<arr.count {
                if((arr[left]+arr[i]) == target){
                    return (left,i);
                }
            }
            left += 1;
        }
        return (0,0);
    }
    
    func method1(arr : Array<Int>,target : Int) -> (Int,Int) {
        
        /**这种方法可能会产生疑问，用数组的元素作为map的key，那么数组元素是可以重复的，map的key却不能重复，后放入的岂不是把先放入的覆盖了吗？其实没关系，题目只是问你数组中两个相加等于target的元素的下标，并没有规定重复的元素取数组靠前或者靠后，所以只要符合两数相加登录target这一条即可*/
        var map = [Int:Int]();
        for i in 0 ..< arr.count {
            map[arr[i]] = i;
        }
        
        for i in 0 ..< arr.count {
            let temp = target -  arr[i];
            if(map.keys.contains(temp)){
                return (map[temp]!,i);
            }
        }
        return (0,0);
    }
}
