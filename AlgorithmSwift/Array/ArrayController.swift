//
//  ArrayController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/8.
//

import UIKit

class ArrayController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.array = [
            [
                "title" : "二维数组中查找",
                "class" : "FindNumberIn2DArray"
            ],
            [
                "title" : "重复整数",
                "class" : "SameNum"
            ],
            [
                "title" : "数组排序",
                "class" : "ArraySort"
            ],
            [
                "title" : "两数之和",
                "class" : "TwoNumberSum"
            ],
            [
                "title" : "三数之和",
                "class" : "ThreeSum"
            ],
            [
                "title" : "最接近三数之和",
                "class" : "NearThreeSum"
            ],
            [
                "title" : "矩阵中的路径",
                "class" : "ArrayPathController"
            ],
            [
                "title" : "机器人的运动格子",
                "class" : "RobotPathController"
            ],
            [
                "title" : "八皇后",
                "class" : "EightQueenController"
            ],
            [
                "title" : "最大盛水量",
                "class" : "MostWater"
            ],
            [
                "title" : "接雨水",
                "class" : "RainWater"
            ],
            [
                "title" : "无序数组中位数",
                "class" : "ArrayMedianController"
            ],
        ]
    }
    
}
