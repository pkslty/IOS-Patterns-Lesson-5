//
//  MyTask.swift
//  Tasks
//
//  Created by Denis Kuzmin on 25.08.2021.
//

import UIKit

class MyTask: Task {
    
    func openTask() {
        //
    }
    
    var name: String
    
    var description: String = "Contents 0 subtasks"
    
    var subTasks: [Task] = [] {
        didSet {
            description = "Contents \(subTasks.count) subtasks"
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func addSubTask(name: String) {
        let subTask = MyTask(name: name)
        self.subTasks.append(subTask)
        //description = "Contents \(subTasks.count) subtasks"
    }
    
    
}
