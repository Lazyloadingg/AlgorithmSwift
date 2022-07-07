//
//  ListNodeController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/8.
//

import UIKit

class ListNodeController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.array = [
            [
                "title" : "链表操作",
                "class" : "ListNodeAction"
            ],
            [
                "title" : "链表反转",
                "class" : "ReverseListNode"
            ],
            [
                "title" : "删除链表倒数第N个节点",
                "class" : "RemoveNodeWithNum"
            ],
            
        ];
    }

}
