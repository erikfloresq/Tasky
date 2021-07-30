//
//  CoreDataManager.swift
//  CoreDataManager
//
//  Created by Erik Flores on 29/7/21.
//

import Foundation
import CoreData

class CoreDataManager: NSObject, ObservableObject {
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
    }
    
    func addElement(_ task: Task) {
        let taskMO = TaskMO(context: managedObjectContext)
        taskMO.id = Int32(tasks.count)
        taskMO.taskStatus = task.status
        taskMO.date = Date.now
        taskMO.descriptionTask = task.description
    }
    
}

extension CoreDataManager: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let tasksFetched = controller.fetchedObjects as? [TaskMO] else {
            return
        }
        tasks = tasksFetched
    }
}
