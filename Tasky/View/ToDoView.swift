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
