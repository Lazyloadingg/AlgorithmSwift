//
//  EightQueenController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/11.
//

import UIKit

class EightQueenController: BaseViewController {

    
    /// 可行解个数
    var count = 0;
    
    /// 皇后数
    var max = 8;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //八皇后问题
        queen();
    }
    
    func queen()  {
        //定义一个数组存放皇后，索引代表行，索引位置元素值代表列
        var visit = Array.init(repeating: -1, count: 8)
        //皇后索引，也代表行数
        let n = 0;
        put(n, visit: &visit);
        print(count);
        
    }
    
    //    第一个皇后先放第一行第一列
    //    第二个皇后从第二行第一列开始判断是否可行，不可行放在第二列、第三列以此类推......
    //    继续第三个皇后，还是第一列、第二列……直到第8个皇后也能放在一个不冲突的位置，算是找到了一个正确解
    //    当得到一个正确解时，在栈回退到上一个栈时，就会开始回溯，即将第一个皇后，放到第一列的所有正确解，全部得到
    //    然后回头继续第一个皇后放第二列，后面继续循环执行1、2、3、4的步骤

    //MARK: 回溯法
    func put(_ n :Int,visit : inout [Int]) {
        //n代表皇后个数，如果已放置的皇后数等于max，证明一次摆放完成，可行解次数加一
        if n == max {
            count += 1;
            printQueen(visit: visit)
            print(count)
            return;
        }
        
        //横向遍历，
        for index in 0..<max {
            //依次将当前行皇后数放在第index列，检验是否可以放置
            visit[n] = index;
            //检验当前位置是否可以放置皇后
            if check(n, visit: &visit) {
                //如果可以放置，继续放下一个皇后
                put(n+1, visit: &visit)
            }
        }
        
    }
    
    func check(_ current : Int,visit : inout [Int])  -> Bool{
    
        //遍历当前行皇后和之前已放置的皇后是否冲突，所以限定条件最大为current，因为后边没放置皇后，绝对不会冲突
        for index in 0..<current {
            //当前皇后如果和之前皇后在同一列；
            if visit[current] == visit[index] || (abs(current - index) == abs(visit[index] - visit[current])){
                return false;
            }
        }
        
//        var left = visit[current] - 1;
//        var rigjt = visit[current] + 1;
//
//
//        var index = current - 1;
//        while index >= 0 {
//            if visit[current] == visit[index] {
//                return false;
//            }
//            if left == visit[current] && left >= 0 {
//                return false;
//            }
//            if rigjt == visit[current] && rigjt < 8{
//                return false;
//            }
//            left -= 1;
//            rigjt += 1;
//            index -= 1;
//        }
        
//        for index in (0..<current).reversed() {
//            if visit[current] == visit[index] {
//                return false;
//            }
//            if left == visit[current] && left >= 0 {
//                return false;
//            }
//            if rigjt == visit[current] && rigjt < 8{
//                return false;
//            }
//            left -= 1;
//            rigjt += 1;
//        }
    
        return true;
    }
    
    
    func printQueen(visit : [Int])  {
        print("\n----------------------------------")
        for index1 in 0..<8 {
            var log = "";
            for index in 0..<8 {
                if visit[index1] == index {
                    log += " Q "
                }else{
                    log += " * "
                }
                
            }
            print(log)
        }
        print("----------------------------------\n")
    }

}
