//
//  TasksViewController.swift
//  DoItApp
//
//  Created by Dylan Grozdanich on 1/15/17.
//  Copyright © 2017 Dylan Grozdanich. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    
    var tasks : [Task] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        TableView.dataSource = self
        TableView.delegate = self

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        TableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSeque", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest())
            print(tasks)
        } catch {
            print("Oops We Have an Error")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as!
            CompleteTaskViewController
            nextVC.task = sender as? Task
           
        }
        
        }
        
    

    }


