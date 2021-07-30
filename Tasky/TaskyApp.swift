//
//  TaskyApp.swift
//  Tasky
//
//  Created by Erik Flores on 18/7/21.
//

import SwiftUI

@main
struct TaskyApp: App {
    @StateObject var toDoViewModel: ToDoViewModel
    @StateObject var doneViewModel = DoneViewModel()
    let persistenceManager: PersistenceManager
    
    init() {
        let manager = PersistenceManager()
        self.persistenceManager = manager
        
        let managedObjectContext = manager.persistentContainer.viewContext
        let storage = CoreDataManager(managedObjectContext: managedObjectContext)
        self._toDoViewModel = StateObject(wrappedValue: ToDoViewModel(storage: storage))
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ToDoView()
                    .tabItem {
                        Image(systemName: "checklist")
                        Text("ToDo")
                    }
                    .environmentObject(toDoViewModel)
                    .environmentObject(doneViewModel)
                DoneView()
                    .tabItem {
                        Image(systemName: "checkmark.circle")
                        Text("Done")
                    }
                    .environmentObject(doneViewModel)
            }
        }
    }
}
