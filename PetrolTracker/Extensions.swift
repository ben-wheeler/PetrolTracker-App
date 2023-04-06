//
//  Extensions.swift
//  PetrolTracker
//
//  Created by Ben Wheeler on 6/4/2023.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    func deleteAllObjects() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        _ = try? self.execute(deleteRequest)
        
        let fetchRequest2 = NSFetchRequest<NSFetchRequestResult>(entityName: "ReadingSession")
        let deleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)
        _ = try? self.execute(deleteRequest2)
    }
}
