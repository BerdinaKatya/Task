//
//  TaskInfoViewController.swift
//  Task
//
//  Created by Ekaterina Teliauberdina on 23.01.2024.
//

import UIKit

class TaskInfoViewController: UIViewController {
    
    @IBOutlet var infoLabel: UILabel!
    
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        infoLabel.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
//        let newCount = count - 1
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task \(currentPosition)")
    }
}
