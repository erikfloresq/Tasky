//
//  ToDoView.swift
//  Tasky
//
//  Created by Erik Flores on 18/7/21.
//

import SwiftUI

struct ToDoView: View {
    @State private var presentedNewTaskView: Bool = false
    @State private var newTaskDescription: String = ""
    @EnvironmentObject var toDoViewModel: ToDoViewModel

    var body: some View {
        NavigationView {
            Group {
                if toDoViewModel.isToDoListIsEmpty {
                    EmptyView(placeHolderText: "You don't have any task 👀")
                } else {
                    TodoList()
                }
            }
            .navigationBarItems(trailing: newTaskButton)
            .navigationTitle("ToDo 📓")
        }
    }

    var newTaskButton: some View {
        Button {
            presentedNewTaskView.toggle()
        } label: {
            Image(systemName: "plus")
        }.sheet(isPresented: $presentedNewTaskView) {
            toDoViewModel.addNewToDoTask(description: newTaskDescription)
        } content: {
            NewTaskView(taskDescription: $newTaskDescription)
        }
    }
}

struct TodoList: View {
    @EnvironmentObject var toDoViewModel: ToDoViewModel
    @EnvironmentObject var doingViewModel: DoingViewModel

    var body: some View {
        List {
            ForEach(toDoViewModel.toDoTasks) { task in
                Text(task.descriptionTask ?? "")
                    .swipeActions(edge: .leading) {
                        Button {
                            toDoViewModel.removeToDoTask(task)
                        } label: {
                            Label("Nevermind", systemImage: "trash")
                        }
                        .tint(Color(.systemRed))
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            doingViewModel.addDoingTask(task)
                            toDoViewModel.update()
                        } label: {
                            Label("Doing", systemImage: "wrench.and.screwdriver")
                        }
                        .tint(Color(.systemYellow))
                    }
            }
        }
        .animation(.spring(), value: toDoViewModel.toDoTasks)
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
