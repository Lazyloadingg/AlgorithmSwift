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
        ]
        
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
        cell?.textLabel?.text = array[indexPath.row]["title"]!;
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

