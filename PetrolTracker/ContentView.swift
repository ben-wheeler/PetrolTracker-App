//
//  ContentView.swift
//  ToDo
//
//  Created by Ben Wheeler on 13/12/21.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\Log.created)])
    var logs: FetchedResults<Log>
        
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            List{
                ForEach(logs){ log in
                    NavigationLink {
                        DetailView(item: log)
                    }
                    label : {
                        Text(log.created ?? Date(), style: .date)
                    }
                }
//                .onDelete(perform: removeItems)
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
            
            .sheet(isPresented: $showingSheet) {
                NewView()
            }
        }
    }
    
//    func removeItems(at offsets: IndexSet) {
//        History.items.remove(atOffsets: offsets)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let dataController = DataController()
        let viewContext = dataController.container.viewContext
        
        dataController.container.viewContext.deleteAllObjects()
        try? dataController.container.viewContext.save()
        
        let testLog = Log(context: viewContext)
        testLog.id = UUID()
        testLog.created = Date()
        testLog.distance = 623.0
        testLog.fuel = 52
        testLog.efficiency = testLog.fuel / testLog.distance
        
        return ContentView()
            .environment(\.managedObjectContext, viewContext)
            .onAppear {
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
    }
}
