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
    @StateObject var doneViewModel: DoneViewModel
    @StateObject var doingViewModel: DoingViewModel
    let persistenceManager: CoreDataStack
    
    init() {
        let manager = CoreDataStack()
        self.persistenceManager = manager
        
        let managedObjectContext = manager.persistentContainer.viewContext
        let storage = PersistenceManager(managedObjectContext: managedObjectContext)
        self._toDoViewModel = StateObject(wrappedValue: ToDoViewModel(storage: storage))
        self._doingViewModel = StateObject(wrappedValue: DoingViewModel(storage: storage))
        self._doneViewModel = StateObject(wrappedValue: DoneViewModel(storage: storage))
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
                    .environmentObject(doingViewModel)
                DoingView()
                    .tabItem {
                        Image(systemName: "hand.thumbsup")
                        Text("Doing")
                    }
                    .environmentObject(toDoViewModel)
                    .environmentObject(doingViewModel)
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
