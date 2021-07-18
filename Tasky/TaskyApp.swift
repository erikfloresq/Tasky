//
//  TaskyApp.swift
//  Tasky
//
//  Created by Erik Flores on 18/7/21.
//

import SwiftUI

@main
struct TaskyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ToDoView()
                    .tabItem {
                        Image(systemName: "checklist")
                        Text("ToDo")
                    }
                DoneView()
                    .tabItem {
                        Image(systemName: "checkmark.circle")
                        Text("Done")
                    }
            }
        }
    }
}
