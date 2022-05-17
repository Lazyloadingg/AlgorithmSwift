//
//  ReverseListNode.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/5/16.
//

import UIKit
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
class ReverseListNode: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //    反转链表
        //    206：https://leetcode.cn/problems/reverse-linked-list/
        var current = ListNode();
        for index in (0..<10).reversed() {
            let tmp = ListNode(index);
            tmp.next = current;
            current = tmp;
        }
        
        let cur1 = ListNode();
        var last : ListNode? = nil;
        for index in 0..<10 {
            let node = ListNode(index);
            if last == nil {
                last = node;
                cur1.next = last;
            }else{
                last?.next = node;
                last = node;
            }
        }
        
        printNode(current);
//        printNode(cur1);
        printNode(reverseList(current));
        printNode(reverseList1(current));
    }
    
    //迭代法
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        //如果头结点为空或只有一个节点，没必要反转直接返回
        if head == nil || head?.next == nil {
            return head;
        }
        var cur = head;
        var newHead : ListNode? = nil;
        while cur != nil {
            //一个一个取出第一个节点，取出后后边节点无人引用会销毁，所以用临时变量保存下第二个节点，也可以看成是以第二个节点为头结点的链表
            let tmp = cur?.next;
            //将取出的节点和newHead连在一起，作为新链表的最后一个节点，head -> newhead -> nil
            cur?.next = newHead;
            //将取出的节点赋值给newHead -> nil
            newHead = cur;
            //将cur赋值为第一步保存的第二个节点，继续循环
            cur = tmp;
        }
        return newHead;
    }
    
    //遍历
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head;
        }
        
        var cur = head;
        var list = [Int]();
        while cur != nil {
            list.append(cur!.val);
            cur = cur?.next;
        }
  
        var newHead : ListNode? = nil;
        for val in list {
            let node = ListNode(val);
            node.next = newHead;
            newHead = node;
        }
        return newHead;
    }
    
    func printNode(_ head : ListNode?)  {
        if head == nil {
            return;
        }
        
        var string = "";
        var tmp : ListNode? = head;
        while tmp?.next != nil {
            string += (String(describing: tmp!.val))
            tmp! = tmp!.next!;
        }
        print(string);
    }
}
