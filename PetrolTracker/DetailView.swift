//
//  DetailView.swift
//  Petrol
//
//  Created by Ben Wheeler on 22/4/2022.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    var item: Log
    
    var body: some View {
        List{
            HStack{
                Image(systemName: "road.lanes")
                Text("Distance Travelled")
                    .bold()
                Spacer()
                Text(String(item.distance))
                Text("km")
            }
            HStack{
                Image(systemName: "fuelpump")
                Text("Petrol Used")
                    .bold()
                Spacer()
                Text(String(item.fuel))
                Text("L")
            }
            HStack{
                Image(systemName: "speedometer")
                Text("Efficiency")
                    .bold()
                Spacer()
                Text(String(format: "%.2f", item.efficiency))
                Text("L per 100 km")
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    deleteLog()
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
        }
        .navigationTitle(Text(item.created ?? Date(), format: .dateTime.day().month().year()))
    }
    func deleteLog() {
        moc.delete(item)
        
        try? moc.save()
        dismiss()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
