//
//  ReversalString.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/17.
//

import UIKit

class ReversalString: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //反转字符串
        let string = "123456789";
        print("反转前：\(string)\n反转后：\(method1(str: string))");
        print("反转前：\(string)\n反转后：\(method2(str: string))");
    }
    //遍历
    func method1(str:String) -> String {
        var temp = "";
        for i in str {
            temp = String(i)+temp;
        }
        return temp;
    }
//    双指针之对撞指针
    func method2(str : String) -> String {
        
        var arr = str.compactMap { i in
            return String(i);
        }
        
        var left = 0;
        var right = arr.count-1;
        while(left < right){
            let temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;
            left += 1;
            right -= 1;
        }
        return arr.joined();
    }
}
