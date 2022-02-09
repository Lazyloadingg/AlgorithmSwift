//
//  RobotPathController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/9.
//

import UIKit

class RobotPathController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
        //机器人移动路径
        
        
        let m = 5;
        let n = 3;
        let k = 3;
        
        print(robotPath(m: m, n: n, k: k))
        
    }
    
    func robotPath(m:Int,n:Int,k:Int) -> Int {
        if m<=0 || n<=0 {
            return 0;
        }
        var result = 0;
        
        for index in 0..<m {
            for index1 in 0..<n {
                print("\((index,index1))")
                let str = String(index) + String(index1);
                let map = str.map { c in
                    return Int(String(c))
                }
                let sum = map.reduce(0) { $0 + $1! }
                if sum <= k{
                    result += 1;
                }
            }
        }
        
        return result;
    }
}
