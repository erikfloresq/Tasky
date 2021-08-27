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
            if UIDevice.current.userInterfaceIdiom == .pad {
                iPadLayout
            } else {
                iPhoneLayout
            }
        }
    }

    var iPhoneLayout : some View {
        TabView {
            NavigationView {
                ToDoView()
                    .tabItem {
                        Image(systemName: "checklist")
                        Text("ToDo")
                    }
                    .environmentObject(toDoViewModel)
                    .environmentObject(doingViewModel)
            }
            NavigationView {
                DoingView()
                    .tabItem {
                        Image(systemName: "hand.thumbsup")
                        Text("Doing")
                    }
                    .environmentObject(toDoViewModel)
                    .environmentObject(doingViewModel)
                    .environmentObject(doneViewModel)
            }
            NavigationView {
                DoneView()
                    .tabItem {
                        Image(systemName: "checkmark.circle")
                        Text("Done")
                    }
                    .environmentObject(doingViewModel)
                    .environmentObject(doneViewModel)
            }
        }
    }

    var iPadLayout: some View {
        NavigationView {
            List {
                NavigationLink {
                    ToDoView()
                        .environmentObject(toDoViewModel)
                        .environmentObject(doingViewModel)
                } label: {
                    Image(systemName: "checklist")
                    Text("ToDo")
                }
                NavigationLink {
                    DoingView()
                        .environmentObject(toDoViewModel)
                        .environmentObject(doingViewModel)
                        .environmentObject(doneViewModel)
                } label: {
                    Image(systemName: "hand.thumbsup")
                    Text("Doing")
                }
                NavigationLink {
                    DoneView()
                        .environmentObject(doingViewModel)
                        .environmentObject(doneViewModel)
                } label: {
                    Image(systemName: "checkmark.circle")
                    Text("Done")
                }
            }
            .navigationTitle("Tasky")
        }
    }
}
