//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Austin Goetz on 9/25/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var task: Task? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    var dueDateValue: Date?
        

    
    // MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueDateTextField.inputView = dueDatePicker
        dueDateValue = task?.due
        
        updateViews()
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text,
        let notes = notesTextView.text
            else { return }
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, due: dueDateValue)
        } else {
            TaskController.sharedInstance.add(taskWithName: name, notes: notes, due: dueDateValue)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = sender.date
        dueDateTextField.text = sender.date.stringValue
    }
    @IBAction func userTappedView(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    
    func updateViews() {
        guard let task = task else { return }
        
        taskNameTextField.text = task.name
        dueDateTextField.text = dueDateValue?.stringValue
        notesTextView.text = task.notes
    }
    
}
