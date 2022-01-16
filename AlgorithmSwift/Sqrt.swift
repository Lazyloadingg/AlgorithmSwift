//
//  Sqrt.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/16.
//

import UIKit

class Sqrt: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //    https://www.cnblogs.com/qlky/p/7735145.html
        //     求任意数的平方根，使用牛顿迭代法，temp先取一个假设值，
        let num = 9.0;
        var temp = 4.0;
        while ((temp * temp - num) > 0.0000001){
            //进入循环后temp恒大于num的真实平方根，num/temp 恒小于num的真实平方根，除以2后不断接近真实平方根，迭代数次即可求解
            temp = (temp + num/temp) / 2.0;
        }
        print("根：\(Int(temp))");
    }
    
}
