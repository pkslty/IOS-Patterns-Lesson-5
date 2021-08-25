//
//  ViewController.swift
//  Tasks
//
//  Created by Denis Kuzmin on 25.08.2021.
//

import UIKit

class ViewController: UIViewController {

    var myTasks: MyTask = MyTask(name: "All tasks")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTasks.addSubTask(name: "All Tasks")
        let tableVC = TaskTableViewController()
        tableVC.task = myTasks
        self.navigationController?.addChild(tableVC)
        self.navigationItem.title = myTasks.name
    }


}

