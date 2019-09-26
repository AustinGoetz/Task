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
    
//    var mockTasks: [Task] {
//        let task1 = Task(name: "Task 1")
//        let task2 = Task(name: "Task w/Notes", notes: "My Notes", due: Date(), isComplete: true)
//        return [task1, task2]
//    }
    
    init() {
        tasks = fetchTasks()
    }

    
    func add(taskWithName name: String, notes: String? = nil, due: Date? = nil) {
        Task(name: name, notes: notes, due: due)
        
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String? = nil, due: Date? = nil) {
        task.name = name
        task.notes = notes
        task.due = due
        
        saveToPersistentStore()
    }
    
    func remove(task: Task) {
        CoreDataStack.context.delete(task)
        
        saveToPersistentStore()
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete.toggle()
        
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
        
    }
    
    func fetchTasks() -> [Task]{
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
}

