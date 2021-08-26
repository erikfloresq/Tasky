//
//  DoneView.swift
//  DoneView
//
//  Created by Erik Flores on 18/7/21.
//

import SwiftUI

struct DoneView: View {
    @EnvironmentObject var doneViewModel: DoneViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if doneViewModel.isDoneListIsEmpty {
                    EmptyView(placeHolderText: "You haven't done any task 😆")
                } else {
                    DoneList()
                }
            }
            .navigationTitle("\(doneViewModel.getTotalDoneTask()) tasks done ✅")
        }
    }
}

struct DoneList: View {
    @EnvironmentObject var doneViewModel: DoneViewModel

    var body: some View {
        List {
            ForEach(doneViewModel.doneTask) { task in
                Text(task.descriptionTask ?? "")
            }
        }
        .animation(.spring(), value: doneViewModel.doneTask)
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView()
    }
}
