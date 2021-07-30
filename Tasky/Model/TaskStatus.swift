//
//  TaskStatus.swift
//  TaskStatus
//
//  Created by Erik Flores on 28/7/21.
//

import Foundation

extension TaskMO {
    var taskStatus: TaskStatus {
        get {
            return TaskStatus(rawValue: self.status!)!
        }
        set {
            self.status = newValue.rawValue
        }
    }
}

enum TaskStatus: String {
    case todo
    case doing
    case done
}
