//
//  CoreDataManager.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import CoreData
import Foundation

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    private let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "DaysLeft")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Unable to initialize Core Data Model \(error)")
            }
        }
    }

    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}
