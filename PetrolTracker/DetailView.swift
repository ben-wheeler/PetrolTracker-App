//
//  DetailView.swift
//  Petrol
//
//  Created by Ben Wheeler on 22/4/2022.
//

import SwiftUI

struct DetailView: View {
    
    let item: Entry
    var body: some View {
        NavigationView{
            List{
                HStack{
                    Text("Distance Travelled")
                        .bold()
                    Spacer()
                    Text(String(item.km))
                    Text("km")
                }
                HStack{
                    Text("Petrol Used")
                        .bold()
                    Spacer()
                    Text(String(item.fuel))
                    Text("L")
                }
                HStack{
                    Text("per 100")
                        .bold()
                    Spacer()
                    Text(String(format:"%.2f", item.fuel/item.km*100))
                }
            }
            .navigationTitle(Text(item.created, format: .dateTime.day().month().year()))

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static let test = Entry(created: Date.now, km: 212.6, fuel: 18.58, perHundred: 9.8, name: "abcd")
    
    static var previews: some View {
        DetailView(item: test)
    }
}
