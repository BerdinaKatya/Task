//
//  ViewController.swift
//  Task
//
//  Created by Ekaterina Teliauberdina on 23.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var tasks: [String] = []
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        updateTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateTasks()
    }
    
    func updateTasks() {
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else { return }
        
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task \(x + 1)") as? String {
                tasks.insert(task, at: 0)
            }
        }
        tableView.reloadData()
    }

    @IBAction func didTapAdd(_ sender: UIBarButtonItem) {
        guard let view = storyboard?.instantiateViewController(identifier: "newTask") as? NewTaskViewController else { return }
        view.title = "New Task"
        updateTasks()
        navigationController?.pushViewController(view, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let view = storyboard?.instantiateViewController(identifier: "taskInfo") as? TaskInfoViewController else { return }
        
        view.task = tasks[indexPath.row]
        navigationController?.pushViewController(view, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = tasks[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
}
