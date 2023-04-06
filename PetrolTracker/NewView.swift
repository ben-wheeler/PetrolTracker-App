//
//  NewView.swift
//  ToDo
//
//  Created by Ben Wheeler on 13/12/21.
//

import SwiftUI

struct NewView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var dateLogged = Date.now
    @State private var distanceTravelled: Double?
    @State private var fuelUsed: Double?
    
    @State private var errorMessage = ""
    @State private var errorTitle = ""
    @State private var showError = false
    
    let distanceInputs = ["Miles", "Kilometers"]
    // Date logged
    // Distance Travelled
    // Fuel used
    
    // Efficiency
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    DatePicker("Date logged", selection: $dateLogged, in: Date.now..., displayedComponents: .date)
                    HStack {
                        Text("Distance Travelled")
                        TextField("0", value: $distanceTravelled, format: .number)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                        Text("km")
                    }
                    HStack{
                        Text("Fuel Used")
                        Spacer()
                        TextField("Fuel Used", value: $fuelUsed, format: .number)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                        Text("L")
                    }
                }
                Section{
                    if(fuelUsed == nil || distanceTravelled == nil){
                        Text("0.00")
                            .foregroundColor(.gray)
                    }
                    else{
                        Text("\(fuelUsed!/distanceTravelled!*100, specifier: "%.2f")")
                    }
                }
            }
            .navigationTitle("New Entry")
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(.gray))
                    }
                }
                
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button("Save") {
                        //                    var distance: Measurement<UnitLength>
                        //                    let fuel: Measurement<UnitVolume>
                        //                    let efficiency: Measurement<UnitFuelEfficiency>
                        
                        //                    let locale = Locale.current //NSLocale.current
                        //                    let isMetric = locale.usesMetricSystem
                        //                        let distance = Measurement(value: distanceTravelled, unit: UnitLength.kilometers)
                        //                        let fuel = Measurement(value: fuelUsed, unit: UnitVolume.liters)
                        //                        let efficiency = Measurement(value: fuelUsed/distanceTravelled*100, unit: UnitFuelEfficiency.litersPer100Kilometers)
                        
                        let newLog = Log(context: moc)
                        newLog.id = UUID()
                        newLog.created = dateLogged
                        newLog.distance = distanceTravelled ?? 0
                        newLog.fuel = fuelUsed ?? 0
                        newLog.efficiency = (fuelUsed ?? 0)/(distanceTravelled ?? 0)*100
                        
                        do {
                            try moc.save()
                            dismiss()
                        } catch {
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                    }
                }
            }
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
