//
//  RemoveNodeWithNum.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/7/7.
//

import UIKit

/// 删除链表倒数第N个节点
class RemoveNodeWithNum: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dump : ListNode? = ListNode(0,head);
        var len = 0;
        var cur  = head;
        while cur != nil  {
            len += 1;
            cur = cur?.next;
        }
        var second = dump;
        for _ in 1..<(len-n+1) {
            second = second?.next;
        }
        second?.next = second?.next?.next;
        return dump?.next;
    }
}
