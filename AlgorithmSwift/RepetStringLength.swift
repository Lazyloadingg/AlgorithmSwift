//
//  RepetStringLength.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/17.
//

import UIKit

class RepetStringLength: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //    https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
        let s = "abcabcdbb";
        let s1 = "pwwkew";
        let s2 = " ";
        let s3 = "aa";
        let s4 = "au";
        let s5 = "bbbbbbb";
        let s6 = "aab";
        print("不重复字符长：\(lengthOfLongestSubstring(s))");
        print("不重复字符长：\(lengthOfLongestSubstring(s1))");
        print("不重复字符长：\(lengthOfLongestSubstring(s2))");
        print("不重复字符长：\(lengthOfLongestSubstring(s3))");
        print("不重复字符长：\(lengthOfLongestSubstring(s4))");
        print("不重复字符长：\(lengthOfLongestSubstring(s5))");
        print("不重复字符长：\(lengthOfLongestSubstring(s6))");
        
    }
    
    //暴力解法
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count <= 1{
            return s.count;
        }
        let arr = s.compactMap { i in
            return String(i);
        }
        var set = Set<String>();
        var left = 0;
        var res = 0;
        
        while (left < arr.count) && (arr.count - left - 1) > set.count {
            set.insert(arr[left]);
            for i in ( left+1)..<arr.count{
                if(!set.contains(arr[i])){
                    set.insert(arr[i])
                }else{
                    res = max(res, set.count);
                    set.removeAll();
                    break;
                }
            }
            
            res = max(res, set.count);
            set.removeAll();
            left += 1;
        }
        return res;
    }

}
