//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Matthew Martindale on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

//We need a way to initialize a Task object given its properties
extension Task {
    @discardableResult convenience init(identifier: UUID = UUID(),
                     name: String,
                     notes: String?,
                     complete: Bool = false,
                     context: NSManagedObjectContext) {
        
        //Set up the NSManagedObject portion of the Task object
        self.init(context: context)
        
        //Assign our unique values to the attributes we created in the data model file
        self.identifier = identifier
        self.name = name
        self.notes = notes
        self.complete = complete
        
    }
}
