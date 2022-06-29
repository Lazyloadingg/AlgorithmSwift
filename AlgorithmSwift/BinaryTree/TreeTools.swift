//
//  TreeTools.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/6/29.
//

import Foundation

class TreeTool {
    
    static func createTree(_ tree : inout TreeNode?,_ list : inout [String]) {
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
            createTree(&tree!.left,&list)
            createTree(&tree!.right,&list)
        }
    }
    
    static func createTree() -> TreeNode?{
        var arr = ["A", "B", "D", "G", "#", "#", "H", "#", "#", "#", "C", "E", "#", "I", "#", "#", "F"];
        var root : TreeNode? = TreeNode("")
        TreeTool.createTree(&root, &arr);
        return root;
    }
    
}
