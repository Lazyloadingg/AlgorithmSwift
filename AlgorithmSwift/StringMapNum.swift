//
//  StringMapNum.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/28.
//

import UIKit

class StringMapNum: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        数字对应的字母的组合
        print(test(s: "35"))
        
    }
    
    //MARK: test
    func test(s:String) -> [String] {
        let resource = makeResource(s: s);
        var result = [""];
        
        for arr in resource {
            result = addLetter(result: result, str: arr);
        }
        return result;
    }
    

    
    func makeResource(s:String) -> [[String]] {
        var resource = [[String]]();
        
        let _ = s.map { str in
            if str == Character("2") {
                resource.append( ["a","b","c"]);
            }else if(str == Character("3")){
                resource.append( ["d","e","f"]);
            }else if(str == Character("4")){
                resource.append( ["g","h","i"]);
            }else if(str == Character("5")){
                resource.append( ["j","k","l"]);
            }else if(str == Character("6")){
                resource.append( ["m","n","o"]);
            }else if(str == Character("7")){
                resource.append( ["p","q","r","s"]);
            }else if(str == Character("8")){
                resource.append( ["t","u","v"]);
            }else if(str == Character("9")){
                resource.append( ["w","x","y","z"]);
            }
        }
        return resource;
    }
    
    func addLetter(result : [String],str:[String]) -> [String] {
        var list = [String]();
        for current in result {
            for s in str {
                list.append(current+s);
            }
        }
        return list;
    }
    
    //MARK: test1
    func test1(s:String) -> [String] {
        
        let resource = makeResource(s: s);
        
        
        
        
    }
    
    func addLetter1(result : [String],str:[String]) -> [String] {
        
        
        for s in str {
            addLetter1(result: <#T##[String]#>, str: <#T##[String]#>)
        }
        
    }


}
