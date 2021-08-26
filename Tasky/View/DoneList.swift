//
//  DoneList.swift
//  DoneList
//
//  Created by Erik Flores on 25/8/21.
//

import SwiftUI

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

struct DoneList_Previews: PreviewProvider {
    static var previews: some View {
        DoneList()
    }
}
