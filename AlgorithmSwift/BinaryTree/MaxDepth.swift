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
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0;
        }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1;
    }


}
