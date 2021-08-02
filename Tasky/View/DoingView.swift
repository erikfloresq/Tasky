//
//  DoingView.swift
//  DoingView
//
//  Created by Erik Flores on 1/8/21.
//

import SwiftUI

struct DoingView: View {
    @EnvironmentObject var toDoViewModel: ToDoViewModel
    @EnvironmentObject var doneViewModel: DoneViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoViewModel.doingTasks) { task in
                    Text(task.descriptionTask ?? "")
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
            }.navigationTitle("Doing 🤖")
        }
    }
}

struct DoingView_Previews: PreviewProvider {
    static var previews: some View {
        DoingView()
    }
}
