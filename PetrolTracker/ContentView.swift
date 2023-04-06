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
                Section(header: Text("Statistics"))
                {
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Average Reading Statistics")
                                .font(.headline)
                        }
                        .foregroundColor(.accentColor)
                        .padding(.vertical, 5)
                        HStack{
                            Image(systemName: "road.lanes")
                            Text(String(format: "%.2f", avgDistance(logs: logs)))
                                .font(.headline)
                            Text("km")
                                .foregroundColor(Color(hue: 1.0, saturation: 0.009, brightness: 0.398))
                        }
                        Spacer()
                        HStack{
                            Image(systemName: "fuelpump")
                            Text(String(format: "%.2f", avgFuel(logs: logs)))
                                .font(.headline)
                            Text("L")
                                .foregroundColor(Color(hue: 1.0, saturation: 0.009, brightness: 0.398))
                        }
                        Spacer()
                        HStack{
                            Image(systemName: "speedometer")
                            Text(String(format: "%.2f", avgEfficiency(logs: logs)))
                                .font(.headline)
                            Text("L per 100 km")
                                .foregroundColor(Color(hue: 1.0, saturation: 0.009, brightness: 0.398))
                        }
                        Spacer()
                        
                    }
                }
                .headerProminence(.increased)
                Section(header: Text("History")){
                    ForEach(logs){ log in
                        NavigationLink {
                            DetailView(item: log)
                        }
                        label : {
                            Text(log.created ?? Date(), style: .date)
                        }
                    }
                }
                .headerProminence(.increased)
//                .onDelete(perform: removeItems)
            }
            .navigationTitle("Welcome")
                        .toolbar {
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
        
       ContentView()
    }
}
