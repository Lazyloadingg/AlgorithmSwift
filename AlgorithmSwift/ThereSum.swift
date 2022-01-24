//
//  ThereSum.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/24.
//

import UIKit

class ThereSum: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let arr = [3,1,2,5,123,56,0,4,19];
        
        print(fastSort(nums: arr));
        
        
    }
    
    
    func fastSort(nums:[Int]) -> [Int]{
        
        var newArr = nums;
        var left = 0;
        var right = newArr.count - 1;
        var current = newArr[left];
        
        if left < right {
         
            while current < newArr[right] && left < right {
                right -= 1;
                if left < right {
                    left += 1;
                    newArr[left] = newArr[right];
                }
            }
            
            while current > newArr[left] && left < right {
                left+=1;
                if left < right {
                    right-=1;
                    newArr[right] = newArr[left];
                }
            }
            
            newArr[left] = current;
            
//            fastSort(nums: <#T##[Int]#>)
            
            
        }
        
        
        return newArr;
    }
}
