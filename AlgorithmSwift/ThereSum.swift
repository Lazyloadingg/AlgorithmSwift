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
        
        
        print(threeSum(nums: arr, target: 60));
        
    }
    
    func threeSum(nums:[Int],target : Int) -> [Any] {
        if nums.count < 3 {
            return [];
        }
        let temp = ArraySort();
        let newArray = temp.insertSort(nums: nums);
        print(newArray);
        var result = [Int]();
        
        for index in 0..<newArray.count - 1 {
            
            if newArray[index] > 0 {
                return result;
            }
            
            var left = index+1;
            var right = newArray.count - 1;
            
            while left < right {
//                
//                if newArray[index] + newArray[left] + newArray[right] == 0 {
//                    
//                }else if(){
//                    
//                }
                
                
            }
            
            
        }
        
   
        
        return result;
        
        
    }
    
    
    
}
