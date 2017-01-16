//
//  CreateTaskViewController.swift
//  DoItApp
//
//  Created by Dylan Grozdanich on 1/15/17.
//  Copyright © 2017 Dylan Grozdanich. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        //Create a task from the outlet information
        
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
     // Add new task to array in previous viewController
        
        previousVC.tasks.append(task)
        previousVC.TableView.reloadData()
        navigationController!.popViewController(animated: true)

        
    }

}
