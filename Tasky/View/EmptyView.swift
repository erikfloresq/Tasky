//
//  EmptyView.swift
//  EmptyView
//
//  Created by Erik Flores on 24/8/21.
//

import SwiftUI

struct EmptyView: View {
    let placeHolderText: String

    var body: some View {
        Text(placeHolderText)
            .foregroundColor(.gray)
            .bold()
            .font(.system(size: 20))
            .multilineTextAlignment(.center)
            .frame(width: 200)

    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(placeHolderText: "You don't have any task 👀")
            .preferredColorScheme(.dark)
    }
}
