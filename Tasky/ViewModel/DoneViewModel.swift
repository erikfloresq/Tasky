//
//  DoneViewModel.swift
//  DoneViewModel
//
//  Created by Erik Flores on 29/7/21.
//

import Foundation
class DoneViewModel: ObservableObject {
    @Published var doneTask: [TaskMO] = []
    
    let storage: PersistenceManager
    
    init(storage: PersistenceManager) {
        self.storage = storage
        doneTask = fetch(status: .done)
    }
    
    func fetch(status: TaskStatus) -> [TaskMO] {
        return storage.tasks.filter({ $0.taskStatus == status })
    }
    
    func getTotalDoneTask() -> Int {
        return doneTask.count
    }
    
    func addDoneTask(_ task: TaskMO) {
        task.taskStatus = .done
        doneTask = fetch(status: .done)
        storage.log()
    }
}
