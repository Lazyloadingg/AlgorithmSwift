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
    var testCount = 0;
    
    /// 皇后数
    var max = 8;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //八皇后问题  https://leetcode-cn.com/classic/problems/eight-queens-lcci/description/
        queen();
    }
    
    func queen()  {
        //定义一个数组存放皇后，索引代表行，索引位置元素值代表列
        var visit = Array.init(repeating: -1, count: 8)
        //皇后索引，也代表行数
        let n = 0;
        put(n, visit: &visit);
        print(count);
        
        var testVisit = Array.init(repeating: -1, count: 8)
        test1(n, visit: &testVisit)
        print("test：\(testCount)")
        
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
        
        //横向遍历，max总列数
        for index in 0..<max {
            //依次将当前行皇后数放在第index列，检验是否可以放置
            visit[n] = index;
            //检验当前位置是否可以放置皇后
            if check(n, colum:index, visit: &visit) {
                //如果可以放置，继续放下一个皇后
                put(n+1, visit: &visit)
            }
        }
    }
    
    func check(_ row : Int ,colum : Int,visit : inout [Int])  -> Bool{
        
        //校验方法1
        //遍历当前行皇后和之前已放置的皇后是否冲突，所以限定条件最大为row，因为后边没放置皇后，绝对不会冲突
        //        for index in 0..<row {
        //            //当前皇后如果和之前皇后在同一列；
        //            if visit[row] == visit[index] || (abs(row - index) == abs(visit[index] - visit[row])){
        //                return false;
        //            }
        //        }
        //
        
        //校验方法2
        //当前皇后左上角
        var left = colum - 1;
        //当前皇后右上角
        var right = colum + 1;
        //右下角无需校验，因为还没有摆放皇后
        
        //从当前皇后，即当前行的上一行开始遍历，
        for index in (0..<row).reversed() {
            //上一个皇后是否和当前皇后同一列
            if colum == visit[index] {
                return false;
            }
            //上一个皇后visit[index]是否在当前皇后对角线左上角
            if left == visit[index] && left >= 0 {
                return false;
            }
            //上一个皇后visit[index]是否在当前皇后对角线右上角
            if right == visit[index] && right < 8{
                return false;
            }
            //都不同则继续往上遍历
            left -= 1;
            right += 1;
        }
        
        //遍历完没有不同则说明当前位置可以放置皇后
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
    
    
    //MARK: test
    func test1(_ n : Int , visit : inout [Int])  {
        
        if n == 8 {
            testCount += 1;
            return;
        }
        
        for colum in 0..<8 {
            if test2(n, colum, visit: &visit) {
                visit[n] = colum;
                test1(n + 1, visit: &visit)
            }
        }
    }
    
    func test2(_ row : Int ,_ colum : Int,visit : inout [Int]) -> Bool {
        
        var leftColum = colum - 1;
        var rightColum = colum + 1;
        
        for index in (0..<row).reversed() {
            if colum == visit[index] {
                return false;
            }
            
            if leftColum >= 0 && visit[index] == leftColum{
                return false;
            }
            
            if rightColum < 8 && visit[index] == rightColum{
                return false;
            }
            
            leftColum -= 1;
            rightColum += 1;
        }
        return true;
    }
}
