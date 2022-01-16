//
//  JumpFloor.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/16.
//

import UIKit

class JumpFloor: BaseViewController {
    
    var cache = [Int:Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //青蛙跳台阶
        //https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof/
        
        let step = 7;
        print("解：\(self.numWays(step))")
        print("解：\(self.numWays1(step))")
    }
    
    //递归1阶2阶跳
    func numWays(_ n: Int) -> Int {
        if(n == 0){
            return 1;
        }
        if(n <= 2 ){
            return n;
        }
        //前边情况值恒确定 直接返回对应值，后边情况进行计算
        //保存计算的值防止递归重复计算耗费资源
        if((self.cache[n]) != nil){
            return self.cache[n]!;
        }
        //到达第n阶有两种方法，从n-1起跳和n-2起跳，那么到达第n阶就是 到达n-1阶所有的方法加 到达n-2阶所有的方法，那么就可从第n阶开始递归计算（n-1）+（n-1）的值
        self.cache[n] = (self.numWays(n-1)+self.numWays(n-2));
        return self.cache[n]! ;
    }
    
    func numWays1(_ n: Int) -> Int {
        
        if(n == 0){
            return 1;
        }
        if(n <= 2 ){
            return n;
        }
        //得出第n阶等于n的前两阶之和后可用迭代法
        var a = 1;
        var b = 2;
        
        for _ in 2..<n {
            let temp = a+b;
            a = b;
            b = temp;
        }
        return b;
    }
    
    
    //变态跳
    //    -(NSInteger)test:(NSInteger)num{
    //        if (num <=2) {
    //            return num;
    //        }else{
    //            if (self.customCache[@(num)]) {
    //                return [self.customCache[@(num)] integerValue];
    //            }
    //            self.customCache[@(num)] = @(2* [self test:num-1]);
    //            return  [self.customCache[@(num)] integerValue];
    //        }
    //    }
}
