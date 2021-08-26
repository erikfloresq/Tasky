//
//  DoingList.swift
//  DoingList
//
//  Created by Erik Flores on 25/8/21.
//

import SwiftUI

struct DoingList: View {
    @EnvironmentObject var toDoViewModel: ToDoViewModel
    @EnvironmentObject var doingViewModel: DoingViewModel
    @EnvironmentObject var doneViewModel: DoneViewModel

    var body: some View {
        List {
            ForEach(doingViewModel.doingTasks) { task in
                Text(task.descriptionTask ?? "")
                    .swipeActions(edge: .leading) {
                        Button {
                            doingViewModel.stopDoingTask(task)
                            toDoViewModel.update()
                        } label: {
                            Label("Stop Doing", systemImage: "stop")
                        }
                        .tint(Color(.systemOrange))
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            doneViewModel.addDoneTask(task)
                            doingViewModel.removeDoingTask(task)
                        } label: {
                            Label("Done", systemImage: "checkmark")
                        }
                        .tint(Color(.systemGreen))
                    }
            }
        }
        .animation(.spring(), value: doingViewModel.doingTasks)
    }
}

struct DoingList_Previews: PreviewProvider {
    static var previews: some View {
        DoingList()
    }
}
