//
//  ToDoView.swift
//  Tasky
//
//  Created by Erik Flores on 18/7/21.
//

import SwiftUI

enum TaskStatus {
    case todo
    case doing
    case done
}

struct Task: Identifiable {
    let id: Int
    let description: String
    let date: Date
    let status: TaskStatus
}

struct ToDoView: View {
    @State private var presentedNewTaskView: Bool = false
    @State private var doingTasks: [Task] = [
        //Task(id: 0, description: "doing 1", date: Date.now, status: .doing)
    ]
    @State private var toDoTasks: [Task] = [
        Task(id: 1, description: "todo 1", date: Date.now, status: .todo),
        Task(id: 0, description: "todo 0", date: Date.now, status: .todo)
    ]


    var body: some View {
        NavigationView {
            List {
                Section("Doing") {
                    ForEach(doingTasks) { task in
                        Text(task.description)
                            .swipeActions(edge: .leading) {
                                Button {

                                } label: {
                                    Label("Stop Doing", systemImage: "stop")
                                }
                                .tint(Color(.systemOrange))
                            }
                            .swipeActions(edge: .trailing) {
                                Button {

                                } label: {
                                    Label("Done", systemImage: "checkmark")
                                }
                                .tint(Color(.systemGreen))
                            }
                    }
                }
                Section("Tasks") {
                    ForEach(toDoTasks) { task in
                        Text(task.description)
                            .swipeActions(edge: .leading) {
                                Button {

                                } label: {
                                    Label("Nevermind", systemImage: "trash")
                                }
                                .tint(Color(.systemRed))
                            }
                            .swipeActions(edge: .trailing) {
                                Button {
                                    self.doingTasks.append(
                                        Task(id: 2, description: "doing 2", date: Date.now, status: .doing)
                                    )
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
        }.sheet(isPresented: $presentedNewTaskView,
                onDismiss: nil) {
            NewTaskView()
        }

    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
