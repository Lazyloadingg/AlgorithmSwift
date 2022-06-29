//
//  Traverse.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/4/10.
//

import UIKit

class TreeNode{
    var val : String
    var left : TreeNode?
    var right : TreeNode?
    init(_ value : String){
        self.val = value;
    }
}

class Traverse: BaseViewController {
    var data : [String] =   ["A", "B", "D", "G", "#", "#", "H", "#", "#", "#", "C", "E", "#", "I", "#", "#", "F"]
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var arr = ["A", "B", "D", "G", "#", "#", "H", "#", "#", "#", "C", "E", "#", "I", "#", "#", "F"];
        var root : TreeNode? = TreeNode("")
        preCreateTree(&root,&arr)
        
        print("root: \(root!.val) left: \(String(describing: root?.left?.val)) right: \(String(describing: root!.right?.val))");
        
        print("递归---------------");
        prePrintNode(tree: root);
        print("---------------");
        inPrintNode(tree: root);
        print("---------------");
        postPrintNode(tree: root)
        print("栈---------------");
        stackPrePrint(root);
        print("回忆测试---------------");
        test(root: root!);
        
    }
    
    
    //MARK: 回忆专用方法
    func test(root:TreeNode?) {
        if root == nil {
            return;
        }
        print(root!.val);
        test(root: root!.left);
        test(root: root!.right);
        
    }

    func preCreateTree(_ tree: inout TreeNode?,_ list : inout [String]) {
        if list.isEmpty {
            return ;
        }
        //#代表空节点
        if list.first == "#"{
            list.remove(at: 0);
            tree = nil
        } else {
            tree = TreeNode(list.first!)
            list.remove(at: 0);
            preCreateTree(&tree!.left,&list)
            preCreateTree(&tree!.right,&list)
        }
    }
//MARK: 🐷 递归遍历法 🐷
    //前序：根左右
    func prePrintNode(tree : TreeNode?)  {
        if tree == nil {
            return;
        }
        print("\(tree?.val ?? "")");
        prePrintNode(tree: tree?.left);
        prePrintNode(tree: tree?.right);
    }
    //中序：左根右
    func inPrintNode(tree : TreeNode?)  {
        if tree == nil {
            return;
        }
        inPrintNode(tree: tree?.left);
        print("\(tree?.val ?? "")");
        inPrintNode(tree: tree?.right);
    }
    //后序：左右根
    func postPrintNode(tree : TreeNode?)  {
        if tree == nil {
            return;
        }
        postPrintNode(tree: tree?.left);
        postPrintNode(tree: tree?.right);
        print("\(tree?.val ?? "")");
    }
    //MARK: 🐷 栈遍历 🐷
    func stackPrePrint(_ tree : TreeNode?)  {
        var stack = [TreeNode]();
        var node = tree;
        while node != nil || !stack.isEmpty{
            while node != nil{
                print(node!.val )
                stack.append(node!);
                node = node!.left;
            }
            if !stack.isEmpty {
                node = stack.last!;
                stack.removeLast();
                node = node!.right;
            }
            
        }
    }
    
}
