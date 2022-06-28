//
//  FindNumberIn2DArray.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/20.
//

import UIKit

class FindNumberIn2DArray: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //查找二维数组中是否包含指定的值 二维数组特点 从左至右递增 从上往下递增
        let arr = [
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ]
        
        let arr1 = [
            [1,2,3,4,5],
            [6,7,8,9,10],
            [11,12,13,14,15],
            [16,17,18,19,20],
            [21,22,23,24,25]
        ]
        print(findNumberIn2DArray(arr, 5));
        print(findNumberIn2DArray(arr, 30));

    }
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix.first?.count == 0{
            return false;
        }
        if target < (matrix.first!.first!) || target > matrix.last!.last! {
            return false;
        }
        
        for arr in matrix {
            if arr.contains(target) {
                return true;
            }
        }
        return false;
    }
}
