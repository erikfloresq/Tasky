//
//  DoingView.swift
//  DoingView
//
//  Created by Erik Flores on 1/8/21.
//

import SwiftUI

struct DoingView: View {
    @EnvironmentObject var doingViewModel: DoingViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if doingViewModel.isDoingListIsEmpty {
                    EmptyView(placeHolderText: "You aren't doing nothing 🙃")
                } else {
                    DoingList()
                }
            }
            .navigationTitle("Doing 🤖")
        }
    }
}

struct DoingView_Previews: PreviewProvider {
    static var previews: some View {
        DoingView()
    }
}
