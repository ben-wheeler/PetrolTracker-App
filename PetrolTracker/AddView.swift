//
//  AddView.swift
//  PetrolTracker
//
//  Created by Ben Wheeler on 22/4/2022.
//

import SwiftUI

struct NewView: View {
    
    @ObservedObject var items: Log
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "test"
    @State private var created = Date.now
    @State private var inputDistance = ""
    @State private var inputFuel = ""
    
    @State private var errorMessage = ""
    @State private var errorTitle = ""
    @State private var showError = false
    
    var body: some View {
        NavigationView {
            Form{
                Section {
//                    TextField("Name", text: $name)

                    TextField(text: $inputDistance, prompt: Text("Distance")) {
                        Text("Distance")
                    }
                    TextField(text: $inputFuel, prompt: Text("Fuel")) {
                        Text("Fuel")
                    }
//                    Toggle("Time", isOn: $hasTime)
//                    if(hasTime){
//                        DatePicker("Due Date", selection: $due, in: Date.now..., displayedComponents: .hourAndMinute)
//                    }
                }
            }
            .navigationTitle("Create a new log")
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction){
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(.gray))
                    }
                }
                ToolbarItemGroup(placement: .confirmationAction){
                    Button("Save") {
//                        let item = TaskItem(name: name, due: due, hasTime: hasTime, completed: false, created: Date.now)
//                        todos.items.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView(items: Log())
    }
}
