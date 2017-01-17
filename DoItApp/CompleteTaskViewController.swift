//
//  CompleteTaskViewController.swift
//  DoItApp
//
//  Created by Dylan Grozdanich on 1/16/17.
//  Copyright © 2017 Dylan Grozdanich. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskName: UILabel!
    
    
    var task : Task? = nil
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if task!.important {
            taskName.text = "❗️\(task!.name!)"
        } else {
            taskName.text = task!.name!
        }
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func completeTapped(_ sender: Any) {

         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
