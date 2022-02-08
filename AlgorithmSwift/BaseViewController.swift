//
//  BaseViewController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/1/16.
//

import UIKit

class BaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var array : [[String:String]] = []
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: view.bounds);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "2333");
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        
        self.loadDefaultSetting();
        self.initSubViews();
    }
    
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
    
    func loadDefaultSetting()  {
    }
    func initSubViews()  {
        self.view.addSubview(self.tableView);
    }


}
