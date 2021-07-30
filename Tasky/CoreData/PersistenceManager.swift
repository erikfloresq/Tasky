//
//  PersistenceManager.swift
//  PersistenceManager
//
//  Created by Erik Flores on 29/7/21.
//

import Foundation
import CoreData
import UIKit

class PersistenceManager {
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tasky")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("oh no we have an error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    init() {
        let center = NotificationCenter.default
        let notification = UIApplication.willResignActiveNotification
        
        center.addObserver(forName: notification, object: nil, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            if self.persistentContainer.viewContext.hasChanges {
                try? self.persistentContainer.viewContext.save()
            }
        }
    }
}
