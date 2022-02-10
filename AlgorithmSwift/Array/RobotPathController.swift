//
//  RobotPathController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/9.
//

import UIKit

class RobotPathController: BaseViewController {
    var count = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
        //机器人移动最大路径
        /**
         这个题和矩阵中的路径（https://leetcode-cn.com/classic/problems/ju-zhen-zhong-de-lu-jing-lcof/description/） 题目相似
         
         */
        let m = 35;
        let n = 15;
        let k = 9;
        
        print(movingCount(m, n, k))

    }
    
    func movingCount(_ m:Int,_ n:Int,_ k:Int) -> Int {
    
        if m<=0 || n<=0 || k<0{
            return 0;
        }
        //1. 创建一个空二维数组，用来标记访问过的每个区域
        var visit : [[Bool]] = Array.init(repeating: Array.init(repeating: false, count: n), count: m)
        
        test(m: m, n: n, x: 0, y: 0, k: k,visit: &visit);
        return count;
    }
    
    func test(m:Int,n:Int, x:Int,y:Int, k:Int,visit : inout [[Bool]])  {

        if x<0 || x >= m || y<0 || y >= n  || ( visit[x][y] == true) {
            return
        }

        let sum = sums(x) + sums(y)
        if sum > k {
            return
        }

        visit[x][y] = true;

        count += 1;
        test(m: m, n: n, x: x+1, y: y, k: k,visit: &visit)
        test(m: m, n: n, x: x, y: y+1, k: k, visit: &visit)
        test(m: m, n: n, x: x-1, y: y, k: k, visit: &visit)
        test(m: m, n: n, x: x, y: y-1, k: k, visit: &visit)

        return ;
    }
    func sums(_ a:Int) -> Int {
        
        var temp = a;
        var result = 0;
        while temp > 0 {
            result += temp % 10;
            temp = Int(temp / 10);
        }
        return result;
    }    
}
