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
                    Text(item.name)
                }
            }
            .navigationTitle(item.created.formatted())

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static let test = Entry(created: Date.now, km: 10.2, fuel: 20.2, perHundred: 9.8, name: "abcd")
    
    static var previews: some View {
        DetailView(item: test)
    }
}
