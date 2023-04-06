//
//  DataController.swift
//  PetrolTracker
//
//  Created by Ben Wheeler on 6/4/2023.
//

import CoreData
import Foundation

class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
     }
 }
