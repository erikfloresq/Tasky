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
            List {
                ForEach(doneViewModel.doneTask) { task in
                    Text(task.descriptionTask ?? "")
                }
            }.navigationTitle("\(doneViewModel.getTotalDoneTask()) tasks done ✅")
        }
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView()
    }
}
