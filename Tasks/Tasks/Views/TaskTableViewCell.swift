//
//  TaskTableViewCell.swift
//  Tasks
//
//  Created by Ben Gohlke on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let reuseIdentifier = "TaskCell"
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var completedButton: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBAction func toggleComplete(_ sender: UIButton) {
        
        guard let task = task else { return }
        
        task.complete.toggle()
        
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Error saving complete toggle context: \(error)")
            CoreDataStack.shared.mainContext.reset()
        }
        
        let buttonImage = task.complete ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
        completedButton.setImage(buttonImage, for: .normal)
        
    }
    
    func updateViews() {
        guard let task = task else { return }
        
        let buttonImage = task.complete ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
        completedButton.setImage(buttonImage, for: .normal)
        
        taskNameLabel.text = task.name
    }
    
}
