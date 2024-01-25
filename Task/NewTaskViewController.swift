//
//  NewTaskViewController.swift
//  Task
//
//  Created by Ekaterina Teliauberdina on 23.01.2024.
//

import UIKit

class NewTaskViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var newTaskTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        newTaskTF.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        
        return true
    }
    
    @objc func saveTask() {
        guard let text = newTaskTF.text, !text.isEmpty else { return }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else { return }
        let newCount = count + 1
        UserDefaults().setValue(newCount, forKey: "count")
        
        UserDefaults().setValue(text, forKey: "task \(newCount)")
        
        navigationController?.popViewController(animated: true)
    }
}
