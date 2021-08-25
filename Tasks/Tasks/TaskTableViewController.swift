//
//  TaskTableViewController.swift
//  Tasks
//
//  Created by Denis Kuzmin on 25.08.2021.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    var task: MyTask!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewCell")
        
        addBarButton()
        
        self.navigationItem.title = task.name
        self.navigationController?.navigationItem.title = task.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return task.subTasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as? TaskTableViewCell
        else {
            return UITableViewCell()
        }

        cell.configure(name: task.subTasks[indexPath.row].name,
                       description: task.subTasks[indexPath.row].description)

        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentTask = task.subTasks[indexPath.row]
        task.openTask()
        let taskVC = TaskTableViewController()
        taskVC.task = currentTask as! MyTask
        navigationController?.show(taskVC, sender: nil)
        
    }
    
}

extension TaskTableViewController {
    private func addBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonTap))
    }
    
    @objc private func addTaskButtonTap() {
        let alert = UIAlertController(title: "New Task", message: "Input New Task Name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in 
            let name = alert.textFields?.first?.text ?? "New Task"
            self.task.addSubTask(name: name)
            self.tableView.reloadData()
        }))
        alert.addTextField()
        present(alert, animated: true)
    }
}
