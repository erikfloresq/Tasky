//
//  TaskyApp.swift
//  Tasky
//
//  Created by Erik Flores on 18/7/21.
//

import SwiftUI

@main
struct TaskyApp: App {
    @StateObject var toDoViewModel = ToDoViewModel()
    @StateObject var doneViewModel = DoneViewModel()
    
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
