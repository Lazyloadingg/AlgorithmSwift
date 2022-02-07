//
//  ListNode.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/7.
//

import UIKit

class listnode{
    var val : Any?;
    var next : listnode?;


}

class SingleList{
    var head : listnode?;
    
    func append(atHead element : listnode)  {
        if head == nil {
            head = element
        }else{
            element.next = head;
            head = element;
        }
    }
    
    func append(atLast element : listnode)  {
        if head == nil {
            head = element
        }else{
            head!.next = element;
        }
    }
    
    func append(at index:Int)  {

    }
}

class ListNode: BaseViewController {

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //    逆序打印链表的值
        //    https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
        let head = listnode();
        head.val = "0";
        print(reversePrint(head));
        
        
    }
    
    func reversePrint(_ head : listnode) -> [Any] {
        
        var p = head;
        var result = [Any]();
        
        while p != nil {
            result.insert(p.val as Any,at: 0);
            if p.next != nil {
                p = p.next!;
            }else{
                break;
            }
        }
        return result;
    }
}
