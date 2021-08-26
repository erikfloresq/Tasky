//
//  PersistenceManager.swift
//  PersistenceManager
//
//  Created by Erik Flores on 29/7/21.
//

import Foundation
import CoreData

class PersistenceManager: NSObject, ObservableObject {
    @Published var tasks: [TaskMO] = []
    private let taskFetchController: NSFetchedResultsController<TaskMO>
    let managedObjectContext: NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
        taskFetchController = NSFetchedResultsController(fetchRequest: TaskMO.fetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        taskFetchController.delegate = self
        
        do {
            try taskFetchController.performFetch()
            tasks = taskFetchController.fetchedObjects ?? []
        } catch {
            print("failed to fetch items!")
        }
        
        log()
    }
    
    func addTask(description: String, status: TaskStatus) {
        let taskMO = TaskMO(context: managedObjectContext)
        taskMO.id = Int32(tasks.count)
        taskMO.taskStatus = status
        taskMO.date = Date.now
        taskMO.descriptionTask = description
        save()
        log()
    }
    
    func remove(_ task: TaskMO) {
        managedObjectContext.delete(task)
        save()
    }
    
    func save() {
        do {
            try managedObjectContext.save()
        } catch (let error) {
            print("Error when try to save a task \(error)")
        }
    }
    
    func log() {
        let fetchRequest = TaskMO.fetchRequest()
        let allResult = try? managedObjectContext.fetch(fetchRequest)
        for entity in allResult ?? [] {
            let id = entity.id
            let descriptionTask = entity.descriptionTask  ?? ""
            let status = entity.status ?? ""
            print("🤖 \(status): \(id) \(descriptionTask)  ")
        }
    }
    
}

extension PersistenceManager: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let tasksFetched = controller.fetchedObjects as? [TaskMO] else {
            return
        }
        tasks = tasksFetched
    }
}
