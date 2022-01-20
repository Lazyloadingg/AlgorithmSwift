//
//  reverseNum.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/19.
//

import UIKit

class reverseNum: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//    https://leetcode-cn.com/classic/problems/reverse-integer/description/
//        给定一个32位有符号整数，返回反转后的数值
        let arr = [
            123,
            -321,
            214748364,
            -214748364
        ];
        _ = arr.map {
            print("\(reverse(x: $0))");
            print("\(reverse1(x: $0))");
        }
    }
    //转字符串反转字符串法
    func reverse1(x : Int ) -> Int32{
        let s = String(x);
        let res = method2(str: s);
        var r = Int32(res)!;
        if r > Int32.max || r < Int32.min{
            r = 0;
        }
        return r;
    }
    
    func method2(str : String) -> String {
        
        var arr = str.compactMap { i in
            return String(i);
        }
        var pre = "";
        if !["1","2","3","4","5","6","7","8","9","0"].contains(arr.first)  {
            pre = arr.first!;
            arr.remove(at: 0);
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
        return pre + arr.joined();
    }
    //数学法
    func reverse(x : Int ) -> Int{
        var n = x;
        var res = 0;
         while(n != 0) {
             //每次取末尾数字，对10取余刚好可以得到个位数也就是最后一个数字
             let tmp = n % 10;
             //判断是否 大于 最大32位整数
             if (res>214748364 || (res==214748364 && tmp > 7)) {
                 return 0;
             }
             //判断是否 小于 最小32位整数
             if (res < -214748364 || (res == -214748364 && tmp < -8)) {
                 return 0;
             }
             res = res*10 + tmp;
             //每次取末尾数字，对10取正刚好可以得到除个位数外剩下的数值
             n /= 10;
         }
         return res;
     }
}
