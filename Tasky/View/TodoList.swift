//
//  TodoList.swift
//  TodoList
//
//  Created by Erik Flores on 25/8/21.
//

import SwiftUI

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
                        .tint(Color(.systemIndigo))
                    }
            }
        }
        .animation(.spring(), value: toDoViewModel.toDoTasks)
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
