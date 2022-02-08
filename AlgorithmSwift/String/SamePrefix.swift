//
//  SamePrefix.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/20.
//

import UIKit

class SamePrefix: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        整个字符串数组的最长公共前缀
        let arr = ["flower","flow","flight","fabc"];
        let arr1 = ["a","b","c","d"];
        
        print("--")
        print(test(n: arr));
        print(test(n: arr1));
        print("--")
    }
    
    
    func test( n : Array<String>) -> String {
        if n.count == 0 {
            return "";
        }
        
        /**
         因为求的是整个字符串数组的公共前缀，一旦有一个字符串和其他字符串的没有公共前缀，即整个数组没有公共前缀，
         所以理论上pre可以取数组内任意一个的字符串 ，然后和数组内剩余字符串进行比较，不过我们此处取第一个字符串
         */
        var pre : String = n[0];
        for index in 1..<n.count {
            while !n[index] .hasPrefix(pre) {
                pre = String(pre.prefix(pre.count-1));
            }
        }
        
        return pre;
    }
    

}
