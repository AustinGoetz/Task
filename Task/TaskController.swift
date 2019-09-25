//
//  TaskController.swift
//  Task
//
//  Created by Austin Goetz on 9/25/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation
import CoreData


class TaskController {
    
    // Singleton
    static let sharedInstance = TaskController()
    
    // Source of Truth
    var tasks: [Task] = []
    
    var mockTasks: [Task] {
        let task1 = Task(name: "Task 1")
        let task2 = Task(name: "Task w/Notes", notes: "My Notes", due: Date(), isComplete: true)
        return [task1, task2]
    }
    
    init() {
        tasks = fetchTasks()
    }

    
    func add(taskWithName name: String, notes: String? = nil, due: Date? = nil) {
        
    }
    
    func update(task: Task, name: String, notes: String? = nil, due: Date? = nil) {
        
    }
    
    func remove(task: Task) {
        
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            
        }
        
    }
    
    func fetchTasks() -> [Task]{
        return mockTasks
//        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
//        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
}

