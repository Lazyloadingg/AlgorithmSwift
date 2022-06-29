//
//  Reversal.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/6/29.
//

import UIKit

/// 反转二叉树 https://leetcode.cn/problems/invert-binary-tree/
class Reversal: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let root : TreeNode? = TreeTool.createTree();
        _ = invertTree(root);
    }
    //MARK: 递归法
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root;
        }
        if let val = root?.val{
            print("\(val)")
        }
        
        let tmp = root?.left;
        root?.left = root?.right;
        root?.right = tmp;
        _ = invertTree( root?.left);
        _ = invertTree( root?.right);
        return root;
    }
}
