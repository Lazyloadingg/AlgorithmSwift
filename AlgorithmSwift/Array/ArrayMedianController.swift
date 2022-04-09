//
//  ArrayMedianController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/4/9.
//

import UIKit

class ArrayMedianController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //无序数组的中位数
        let arr = [4,0,1,2,9,8,3,7,10];
        
        print(arr);
        
        print(arr.sorted());
        print(test(arr: arr));
    }
    func test(arr : [Int]) -> Double {
        var result = 0.0;
        let sort : [Int] = arr.sorted();
        if arr.count % 2 == 0 {
            result = Double((sort[arr.count / 2] + sort[arr.count / 2 - 1])) / 2.0;
        }else{
            result = Double(sort[arr.count / 2]);
        }
        return result;
    }
    
    
    // MARK: 👉🏻 🐷Life cycle🐷
    // MARK: 👉🏻 🐷System Delegate🐷
    // MARK: 👉🏻 🐷Custom Delegate🐷
    // MARK: 👉🏻 🐷Event  Response🐷
    // MARK: 👉🏻 🐷Private Methods🐷
    // MARK: 👉🏻 🐷Lazy loading🐷
    // MARK: 👉🏻 🐷Init SubViews🐷

}
