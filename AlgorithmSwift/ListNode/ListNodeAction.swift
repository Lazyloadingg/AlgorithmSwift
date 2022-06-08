//
//  ListNode.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/7.
//

import UIKit


/// 链表协议
protocol LinkedListProtocol {
    associatedtype T : Equatable
    
    func append(atHead element : T)
    func append(atLast element : T)
    func insert(_ element : T,at index:Int)
    
}

/// 链表节点
class listnode<T:Equatable>{
    var val : T?;
    var next : listnode?;
    
    init(_ value : T?) {
        self.val = value;
    }
    
}

/// 单向链表
class SingleList<T:Equatable> : LinkedListProtocol{
    var head : listnode<T>?;
    
    private func node(of index : Int)->listnode<T>{
        
        if index == 0 {
            return head!;
        }
        
        var currentIndex = index;
        var currentNode = head;
        while currentIndex > 0 {
            
            currentNode = currentNode?.next;
            currentIndex -= 1;
            
        }
        return currentNode!;
        
    }
    
    /// 头部添加节点
    /// - Parameter element: 插入的值
    func append(atHead element: T) {
        if head == nil {
            head = listnode(element);
        }else{
            let new = listnode(element);
            new.next = head;
            head = new;
        }
    }
    
    /// 尾部添加节点
    /// - Parameter element: 插入的值
    func append(atLast element: T) {
        if head == nil {
            head =  listnode(element);
        }else{
            var current = head;
            while current?.next != nil {
                current = current?.next;
            }
            current?.next = listnode(element);
        }
    }
    
    /// 任意下标添加节点
    /// - Parameters:
    ///   - element: 插入的值
    ///   - index: 要插入的下标
    func insert(_ element: T, at index: Int) {
        
        if head == nil {
            return;
        }
        if index == 0 {
            append(atHead: element);
            return;
        }
        if index == count() {
            append(atLast: element);
            return;
        }
        var temp = index-1;
        var p = head;
        while p?.next != nil{
            if(temp == 0){
                let new = listnode(element);
                new.next = p?.next;
                p?.next = new;
                return;
            }else if index > 0 {
                p = p?.next;
                temp -= 1;
            }else{
                return;
            }
        }
    }
    
    /// 打印链表内容
    /// - Returns: 内容数组
    func linkedListPrint() -> [T] {
        var result = [T]();
        var current = head;
        while current != nil {
            result.append((current?.val)!);
            current = current?.next;
        }
        return result;
    }
    
    /// 链表长度
    /// - Returns: 长度
    func count()->Int{
        if head == nil {
            return 0;
        }
        var result = 0;
        var current = head;
        while current != nil {
            result += 1
            current = current?.next;
        }
        return result;
    }
    
}



class ListNodeAction: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    逆序打印链表的值
        //    https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
        
        let list = SingleList<Int>();
        for index in 0..<10 {
            list.append(atHead: index);
            list.append(atLast: index);
        }
        
        list.insert(11, at: 0)
        list.insert(21, at: 21)
        list.insert(100, at: 4)
        print(list.linkedListPrint())
        print(list.count())
        print(reversePrint(list.head!));
        print(reverseList(list)!.linkedListPrint())
        
    }
    
//    func reversePrint(_ head : listnode<Int>?) -> [Any] {
//
//        var p = head;
//        var result : [Int] = [Int]();
//        while p != nil {
//            result.insert(p!.val!,at: 0);
//            p = p!.next;
//        }
//        return result;
//    }
    
    func reversePrint(_ head : listnode<Int>?) -> [Any] {
        
        var p = head;
        var temp : [Int] = [Int]();
        while p != nil {
            temp.append(p!.val!);
            p = p!.next;
        }
        var result : [Int] = [Int]();
        for item in (0..<temp.count).reversed() {
            result.append(temp[item])
        }
        return result;
    }
    
    func reverseList(_ list : SingleList<Int>) -> SingleList<Int>? {
        if list.head == nil || list.head?.next == nil {
            return list;
        }
        var newHead = listnode<Int>.init(0);
        
        var p : listnode? = list.head;
        while p  != nil{
            let next = p!.next;
            p!.next = newHead;
            newHead = p!;
            p = next;
        }
        return list;
    }
    
}
