//
//  ReplaceBlank.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/20.
//

import UIKit

class ReplaceBlank: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let test = [
            "hello world !",
            "   ",
            "123",
            " abc",
            "def "
        ]
        
        _ = test.map {
            print(replaceString(s: $0));
        }
    }
    func replaceString(s:String) -> String {
        
        var arr = s.map {
            return String($0);
        }
        for index in 0..<arr.count {
            if arr[index] == " " {
                arr[index] = "%20"
            }
        }
        return arr.joined();
    }
    

 
}
