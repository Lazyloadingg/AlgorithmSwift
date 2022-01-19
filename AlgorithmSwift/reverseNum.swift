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
    
    func reverse1(x : Int ) -> Int{
        let s = String(x);
        let res = method2(str: s);
        var r = Int(res)!;
        if r > Int.max || r < Int.min{
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
    func reverse(x : Int ) -> Int{
        var n = x;
        var res = 0;
         while(n != 0) {
             //每次取末尾数字
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
             n /= 10;
         }
         return res;
     }



}
