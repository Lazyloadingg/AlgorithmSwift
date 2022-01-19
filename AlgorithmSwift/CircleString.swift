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
            "abba",
            "abb",
            "abcccba",
            ""
        ];
        
        _ = test.map { str in
            print("---------------")
            print("原字符串：\(str)")
            print("最大回文串1：\(self.method(str: str))");
            print("最大回文串2：\(self.method2(str: str))");
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
    
    //中心扩展法
    func method2(str:String) -> String {
        if(str.count < 1){
            return "";
        }
        let arr = str.compactMap { i in
            return String(i);
        }
        var maxLen = 1;
        var left = 0;
        for i in 0..<arr.count {
            /**
             回文字符就是中心对称字符，从中心往两边延每个对应字符都相同，所以
             
             1. 我们遍历整个字符串，然后以每个字符为中心往两边延展，直到两侧字符不相同为止
             2. 但是中心分两种情况，单数长度回文的中心是一个字符，双数长度回文的中心是两个字符，所以每次遍历要把两种情况都考虑到，然后取更长的那个字符，并记录下长度和初始字符位置
             3. 遍历完整个字符串后取长度更长的回文字符返回
             */
            let len1 = expandString(arr: arr, left: i, right: i);
            let len2 = expandString(arr: arr, left: i, right: i+1);
            let len = max(len1, len2);
            
            if len > maxLen {
                maxLen = len;
                //因为两侧对称，i为字符中心位置，所以i两侧的字符长度相等，所以此回文的起点为 i （减去长度 -1 除以2）
                left = i - (len-1) / 2;
            }
        }
        return arr[left..<left+maxLen].joined();
    }
    
    func expandString(arr : [String],left : Int,right : Int) -> Int{
        var l = left;
        var r = right;
        while l >= 0 && r < arr.count {
            if arr[l] == arr[r] {
                //因为此处判断相等后继续延展，那么最后一次延展后两侧索引对应的字符是不等的，所以最后返回长度时 right-left后要再减去1
                l -= 1;
                r += 1;
            }else{
                break;
            }
        }
        return r - l - 1;
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
