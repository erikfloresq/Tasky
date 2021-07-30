//
//  TaskMO+CoreDataProperties.swift
//  TaskMO
//
//  Created by Erik Flores on 30/7/21.
//
//

import Foundation
import CoreData

extension TaskMO {

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

extension TaskMO : Identifiable {

}
