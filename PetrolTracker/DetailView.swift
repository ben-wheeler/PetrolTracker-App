//
//  DetailView.swift
//  Petrol
//
//  Created by Ben Wheeler on 22/4/2022.
//

import SwiftUI

struct DetailView: View {
     
    var item: Entry
    
        var body: some View {
        NavigationView{
            List{
                HStack{
                    Text("Distance Travelled")
                        .bold()
                    Spacer()
                    Text(item.distance, format: .measurement(width: .abbreviated))
                }
                HStack{
                    Text("Petrol Used")
                        .bold()
                    Spacer()
                    Text(item.fuel, format: .measurement(width: .abbreviated))
                }
                HStack{
                    Text("Efficiency")
                        .bold()
                    Spacer()
                    Text(item.efficiency, format: .measurement(width: .abbreviated))
                }
            }
            .navigationTitle(Text(item.created, format: .dateTime.day().month().year()))
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let d = Measurement(value: 216.5, unit: UnitLength.kilometers)
    static let v = Measurement(value: 65468789645, unit: UnitVolume.liters)
    static let e = Measurement(value: 9.8, unit: UnitFuelEfficiency.litersPer100Kilometers)

    static let test = Entry(created: Date.now, distance: d, fuel: v, efficiency: e)
    
    static var previews: some View {
        DetailView(item: test)
//            .environment(\.locale, .init(identifier: "en_AU"))
    }
}
