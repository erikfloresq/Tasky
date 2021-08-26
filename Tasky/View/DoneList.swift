//
//  DoneList.swift
//  DoneList
//
//  Created by Erik Flores on 25/8/21.
//

import SwiftUI

struct DoneList: View {
    @EnvironmentObject var doneViewModel: DoneViewModel
    @EnvironmentObject var doingViewModel: DoingViewModel

    var body: some View {
        List {
            ForEach(doneViewModel.doneTask) { task in
                Text(task.descriptionTask ?? "")
                    .swipeActions(edge: .leading,
                                  allowsFullSwipe: false) {
                        Button {
                            doneViewModel.removeDoneTask(task)
                            doingViewModel.update()
                        } label: {
                            Label("Stop Doing", systemImage: "arrowshape.turn.up.backward")
                        }
                        .tint(Color(.systemOrange))
                    }
            }
        }
        .animation(.spring(), value: doneViewModel.doneTask)
    }
}

struct DoneList_Previews: PreviewProvider {
    static var previews: some View {
        DoneList()
    }
}
