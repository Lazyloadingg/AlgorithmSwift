//
//  ViewController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/16.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let array = [
        [
            "title" : "平方根",
            "class" : "Sqrt"
        ],
        [
            "title" : "青蛙跳台阶",
            "class" : "JumpFloor"
        ],
        [
            "title" : "两矩阵重叠面积",
            "class" : "Area"
        ],
        [
            "title" : "反转字符串",
            "class" : "ReversalString"
        ],
        [
            "title" : "最大盛水量",
            "class" : "MostWater"
        ],
        [
            "title" : "两数之和",
            "class" : "TwoNumberSum"
        ],
        [
            "title" : "不重复最长字符串",
            "class" : "RepetStringLength"
        ],
        [
            "title" : "最长回文字符串",
            "class" : "CircleString"
        ],
        [
            "title" : "整数翻转",
            "class" : "reverseNum"
        ],
        [
            "title" : "最长公共前缀",
            "class" : "SamePrefix"
        ],
        [
            "title" : "重复整数",
            "class" : "SameNum"
        ],
        [
            "title" : "替换字符串空格",
            "class" : "ReplaceBlank"
        ],
        [
            "title" : "二维数组中查找",
            "class" : "FindNumberIn2DArray"
        ],
        [
            "title" : "三数之和",
            "class" : "ThreeSum"
        ],
        [
            "title" : "数组排序",
            "class" : "ArraySort"
        ],
        [
            "title" : "最接近三数之和",
            "class" : "NearThreeSum"
        ],
        [
            "title" : "电话号码的字母组合",
            "class" : "StringMapNum"
        ],
        [
            "title" : "链表操作",
            "class" : "ListNode"
        ],
        
    ];
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: view.bounds);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "2333");
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadDefaultSetting();
        self.initSubViews();
    }
    
    // MARK: 👉🏻 🐷Life cycle🐷
    // MARK: 👉🏻 🐷System Delegate🐷
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "2333");
        cell?.textLabel?.text = String(indexPath.row+1) + "：" + array[indexPath.row]["title"]!;
        return cell!;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let controllerName = array[indexPath.row]["class"]!;
        let projectName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        let className = projectName! + "." + controllerName
        let vc = NSClassFromString(className) as! UIViewController.Type
        let viewController = vc.init()
        self.navigationController?.pushViewController(viewController, animated: true)

    }
    // MARK: 👉🏻 🐷Custom Delegate🐷
    // MARK: 👉🏻 🐷Event  Response🐷
    // MARK: 👉🏻 🐷Private Methods🐷
    // MARK: 👉🏻 🐷Lazy loading🐷
    // MARK: 👉🏻 🐷Init SubViews🐷
    func loadDefaultSetting()  {
    }
    func initSubViews()  {
        self.view.addSubview(self.tableView);
    }


}

