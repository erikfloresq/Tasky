//
//  NewTaskView.swift
//  NewTaskView
//
//  Created by Erik Flores on 18/7/21.
//

import SwiftUI

struct NewTaskView: View {
    @State private var taskDescription: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Add the description of the task")
                    .foregroundColor(Color(.systemGray))
                TextEditor(text: $taskDescription)
                    .padding()
                    .frame(height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                Spacer()
            }
            .padding()
            .navigationBarItems(trailing: doneButton)
            .navigationTitle("New Task")
        }
    }

    var doneButton: some View {
        Button {
            print("")
        } label: {
            Text("Done")
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
