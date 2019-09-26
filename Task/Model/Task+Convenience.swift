//
//  Task+Convenience.swift
//  Task
//
//  Created by Austin Goetz on 9/25/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation

extension Task {
    @discardableResult
    convenience init(name: String, notes: String? = nil, due: Date? = nil, isComplete: Bool = false) {
        self.init(context: CoreDataStack.context)
        self.name = name
        self.notes = notes
        self.due = due
    }
    
}
