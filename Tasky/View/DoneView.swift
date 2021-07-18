//
//  DoneView.swift
//  DoneView
//
//  Created by Erik Flores on 18/7/21.
//

import SwiftUI

struct DoneView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Win design awards")
            }.navigationTitle("5 tasks done ✅")
        }
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView()
    }
}
