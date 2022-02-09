//
//  ArrayPathController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/9.
//

import UIKit

class ArrayPathController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    https://leetcode-cn.com/classic/problems/ju-zhen-zhong-de-lu-jing-lcof/description/
        //    矩阵中的路径
        
        //矩阵
        let matrix =  [
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ];
        
        //测试用例
        let arr = [
            "ABCCED",
            "ASFD",
            "CCEDA",
            "EAFD",
            "SCEE",
            "SES"
        ]
        
        for str in arr {
            print("-------------")
            print(str)
            print(test(arr: matrix, target: str))
            print("-------------\n")
        }
        print(matrix);
        
        
    }
    
    func test(arr:[[String]],target:String) -> Bool {
        if arr.count == 0 {
            return false;
        }
        
        let words = target.map { str in
            return String(str);
        }
        
        /**
         首先分析题目，可以将问题简化为，
         1. 寻找目标字符上下左右的特定值，
         2. 如果找到，则将特定值变为目标值继续寻找，即重复第一步，
         */
        
        // 编码
        // 1. 那么首先对二维数组进行遍历 ，取出每一个字符
        for index in 0..<arr.count {
            for index1 in 0..<arr[0].count {
                //2. 把每个元素当成目标值进行递归检索（因为在分析阶段我们可知要不断向下进行同样操作检索）
                let res = recursion(arr: arr, target: words, row: arr.count, col: arr[0].count, x: index, y: index1, k: 0)
                if res {
                    return res;
                }
            }
        }
        
        return false;
    }
    
    func recursion(arr:[[String]],target:[String], row:Int,col:Int, x:Int,y:Int,k:Int) -> Bool {
        var temp = arr;
        //3. 确定边界
        if x < 0 || x >= row || y < 0 || y >= col || arr[x][y] != target[k] {
            return false;
        }
        //4. 如果已经检索完目标的每一个元素，说明已经找到
        if k == target.count - 1  {
            return true;
        }
        
        var res = false;
        //5. 将已经找到的值替换成特殊字符作为已经找到的标记，防止重复检索，我此处用空格代替，可以使用任何字符，只要保证不会与目标字符相等且数组中没有重复值即可
        temp[x][y] = "  ";
        //6. 递归检索
        res =
        recursion(arr: temp, target: target, row: row, col: col, x: x+1, y: y, k: k+1) ||
        recursion(arr: temp, target: target, row: row, col: col, x: x, y: y+1, k: k+1) ||
        recursion(arr: temp, target: target, row: row, col: col, x: x-1, y: y, k: k+1) ||
        recursion(arr: temp, target: target, row: row, col: col, x: x, y: y-1, k: k+1)
        
        //7. 如果没有找到，将第五步替换的特殊字符换回去，恢复原数组（为什么此处会确定没找到，因为如果找到的话第四步就已经返回不会来到这里，来到这里说明未找到）
        temp[x][y] = target[k];
        return res;
        
    }
    
}
