//
//  ContentView.swift
//  ToDo
//
//  Created by Ben Wheeler on 13/12/21.
//

import SwiftUI

struct Entry: Identifiable, Codable {
    var id = UUID()
    let created: Date
    let km: Double
    let fuel: Double
    let perHundred: Double
    let name: String
}

class Log: ObservableObject {
    @Published var items = [Entry](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Entry].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @StateObject var History = Log()
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(History.items){ log in
                    NavigationLink {
                        DetailView(item: log)
                    }
                    label : {
                        Text(log.name)
                    }
                }
            }
            .navigationTitle("History")
                        .toolbar {
                            ToolbarItemGroup(placement: .cancellationAction){
                                EditButton()
                            }
                            ToolbarItemGroup(placement: .confirmationAction){
                                Button {
                                    showingSheet.toggle()
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                }
                            }
                        }
            
//            .sheet(isPresented: $showingSheet) {
//                NewView(todos: todos)
//            }
        }
        
    }
    
//    func removeItems(at offsets: IndexSet) {
//        todos.items.remove(atOffsets: offsets)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
