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
    @EnvironmentObject var doneViewModel: DoneViewModel

    var body: some View {
        NavigationView {
            List {
                Section("Doing") {
                    ForEach(toDoViewModel.doingTasks) { task in
                        Text(task.description)
                            .swipeActions(edge: .leading) {
                                Button {
                                    toDoViewModel.stopDoingTask(task)
                                } label: {
                                    Label("Stop Doing", systemImage: "stop")
                                }
                                .tint(Color(.systemOrange))
                            }
                            .swipeActions(edge: .trailing) {
                                Button {
                                    doneViewModel.addDoneTask(task)
                                    toDoViewModel.removeDoingTask(task)
                                } label: {
                                    Label("Done", systemImage: "checkmark")
                                }
                                .tint(Color(.systemGreen))
                            }
                    }
                }
                Section("Tasks") {
                    ForEach(toDoViewModel.toDoTasks) { task in
                        Text(task.description)
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
                                    toDoViewModel.addDoingTask(task)
                                } label: {
                                    Label("Doing", systemImage: "wrench.and.screwdriver")
                                }
                                .tint(Color(.systemYellow))
                            }
                    }
                }
            }
            .navigationBarItems(trailing: newTaskButton)
            .navigationTitle("ToDo 📓")
        }
    }

    var header: some View {
        HStack {
            Text("Doing")
            ZStack {
                Circle()
                    .fill(Color(.systemGreen))
                Text("1")
                    .font(.system(size: 14))
                    .bold()
                    .foregroundColor(Color(.systemBackground))
            }.frame(width: 20, height: 20)
            Spacer()
        }.frame(width: 110)
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

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
