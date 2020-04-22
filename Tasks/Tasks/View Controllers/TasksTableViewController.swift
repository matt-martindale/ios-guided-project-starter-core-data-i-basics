//
//  TasksTableViewController.swift
//  Tasks
//
//  Created by Ben Gohlke on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import CoreData

class TasksTableViewController: UITableViewController {

    // MARK: - Properties
    
    // NOTE! This is not a good, efficient way to do this, as the fetch request
    // will be executed every time the tasks property is accessed. We will
    // learn a better way to do this later.
    
    // Read part of CRUD
    var tasks: [Task] {
        
        // Fetch Request to fetch Tasks specifically
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        // Context you want to fetch the model objects into
        let context = CoreDataStack.shared.mainContext
        
        do {
            let fetchedTasks = try context.fetch(fetchRequest)
            return fetchedTasks
        } catch {
            NSLog("Error fetching tasks: \(error)")
            return []
        }
    }
    
    // MARK: - View Lifecycle

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        
        return cell
    }

        // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let task = tasks[indexPath.row]
            let context = CoreDataStack.shared.mainContext
            
            context.delete(task)
            
            do {
                try context.save()
            } catch {
                NSLog("Error saving context after deleting task: \(error)")
                context.reset()
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
