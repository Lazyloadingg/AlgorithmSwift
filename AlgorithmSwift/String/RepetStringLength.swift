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
        //最长不重复字符
        let test = [
            "abcabcdbb",
            "pwwkew",
            "",
            " ",
            "aa",
            "au",
            "bbbbbbb",
            "aab",
            "abcc"
        ];
        
        _ = test.map { str in
            print(str)
            print("---------------------")
            print("不重复字符长：\(lengthOfLongestSubstring(str))");
            print("不重复字符长：\(lengthOfLongestSubstring1(str))");
            print("---------------------")
            print("\n")
        }
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
        
        /**双重遍历集合存储，先将第一层循环元素存入set，校验第二层元素是否存在集合，不存在则存入，存在则记录当前最长长度并清空集合，跳出循环继续
         ，两次遍历完即可得到最长不重复字符
         */
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
    
    //    双指针之快慢指针/滑动窗口
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        
        /**快慢指针一层遍历，先取快指针对应的元素判断集合中是否存在，不存在则存入，并将右指针+1，记录长度，继续向下遍历，如果存在，则右指针保持不动，集合删除坐指针左指针元素，并将左指针+1，继续向下遍历
         */
        var sets = Set<String>();
        var left = 0;
        var right = 0;
        var res = 0;
        
        let arr = s.compactMap { i in
            return String(i);
        }
        
        while(left <= right && right < arr.count){
            
            let s = arr[left];
            let e = arr[right];
            
            if !sets.contains(e) {
                sets.insert(e);
                right += 1;
                res = max(res, sets.count);
            }else{
                sets.remove(s);
                left += 1;
            }
        }
        return res;
    }
    
}
