//
//  MaxDepth.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/6/29.
//

import UIKit

/// 二叉树深度 https://leetcode.cn/problems/er-cha-shu-de-shen-du-lcof/
class MaxDepth: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let root : TreeNode? = TreeTool.createTree();
        print("\(maxDepth(root))");
        print("\(maxDepth1(root))");
        
    }
    //MARK: 递归
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0;
        }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1;
    }
    
    //MARK: 栈-层次遍历 ：将每一层的所有节点入栈，然后遍历目前栈中所有节点，移除每一个节点同时将他们的子节点入栈，一直循环到栈为空
    func maxDepth1(_ root: TreeNode?) -> Int {
        guard let new = root else{
            return 0;
        }
        var queue = [TreeNode]();
        var count = 0;
        queue.append(new);
        while !queue.isEmpty {
            //每一层的节点个数
            let size = queue.count;
            //移除当前层所有节点，并将他们的子节点入栈
            for _ in 0..<size {
                let cur = queue.first;
                queue.removeFirst();
                if let left = cur?.left {
                    queue.append(left);
                }
                if let right = cur?.right {
                    queue.append(right);
                }
            }
            //移除一层所有节点后，就算当前层遍历完毕，深度+1
            count += 1;
        }
        return count;
    }

}
