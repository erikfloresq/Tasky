//
//  TaskMO+CoreDataClass.swift
//  TaskMO
//
//  Created by Erik Flores on 30/7/21.
//
//

import Foundation
import CoreData

@objc(TaskMO)
public class TaskMO: NSManagedObject {}

// MARK: - CoreData Properties

extension TaskMO: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskMO> {
        let fetch = NSFetchRequest<TaskMO>(entityName: "TaskMO")
        let sort = NSSortDescriptor(key: #keyPath(TaskMO.date), ascending: false)
        fetch.sortDescriptors = [sort]
        return fetch
    }

    @NSManaged public var date: Date?
    @NSManaged public var descriptionTask: String?
    @NSManaged public var id: Int32
    @NSManaged public var status: String?

}

// MARK: - Enum support

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
