//
//  CircleString.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/18.
//

import UIKit

class CircleString: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    https://leetcode-cn.com/classic/problems/longest-palindromic-substring/description/
        //    最长回文子串，回文就是正反着读都一样，比如
        let test = [
            "ababa",
            "aa",
            "cbbd",
            "ac",
            "n",
            "上海自来水来自海上"
        ];
        
        _ = test.map { str in
            print("---------------")
            print("原字符串：\(str)")
            print("最大回文串1：\(self.method(str: str))");
//            print("最大回文串2：\(self.method2(str: str))");
            print("---------------")
            print("\n");
        }
        
    }
    //反转遍历，公共子串法
    func method(str : String) -> String {
        if(str.count < 1){
            return "";
        }
        /**
         1. 根据回文的定义可以知道理论上最长的回文子串就是原字符串本身，
         2. 那么我们把原字符串反转，然后遍历依次字符串，
         3. 比较原字符串和反转后的字符串每一个下标位字符是否相等，如果相等则存储起来，如果不等则记录下此时的存储字符串，清空存储继续遍历
         */
        
        let arr = str.compactMap { i in
            return String(i);
        }
        let revserArr = self.tool(str: str);
        
        var temp = [String]();
        var res = "";
        for i in 0..<arr.count{
            let s = arr[i];
            let s1 = revserArr[i];
            if s == s1 {
                temp.append(s);
            }else{
                let join = temp.joined();
                res =  join.count > res.count ? join : res;
                temp.removeAll();
            }
        }
        if(temp.count == 0){
            temp.append(arr[0]);
        }
        return res.count > 0 ? res : temp.joined();
    }
    
    func method2(str:String) -> String {
        if(str.count < 1){
            return "";
        }
        var res = "";
        let arr = str.compactMap { i in
            return String(i);
        }
        var center = arr.count / 2;
        var left = center-1;
        var right = center+1;
        while center > 0 && center < arr.count {
            let s = arr[left];
            let  e = arr[right];
            if(s == e){
                let temp = arr[left...right].joined();
                res = res.count > temp.count ? res : temp;
                left -= 1;
                right += 1;
            }else{
                center += 1;
            }
        }
        
        return res;
    }
    
    //MARK: tool
    //    反转字符串
    func tool(str : String) -> [String] {
        
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
        return arr;
    }
    
}
