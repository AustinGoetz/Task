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
    
    
    let fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let completeSort = NSSortDescriptor(key: "isComplete", ascending: true)
        let dueSort = NSSortDescriptor(key: "due", ascending: true)
        
        fetchRequest.sortDescriptors = [completeSort, dueSort]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isComplete", cacheName: nil)
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error fetching from fetch Controller \(error) \\ \(error.localizedDescription)")
        }
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
}

