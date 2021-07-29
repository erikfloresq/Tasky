//
//  DoneViewModel.swift
//  DoneViewModel
//
//  Created by Erik Flores on 29/7/21.
//

import Foundation

class DoneViewModel: ObservableObject {
    @Published var doneTask: [Task] = []
    
    func getTotalDoneTask() -> Int {
        return doneTask.count
    }
    
    func addDoneTask(_ task: Task) {
        doneTask.append(task)
    }
}
