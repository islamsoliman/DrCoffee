//
//  DrCoffeeStoresDB.swift
//  DrCoffe
//
//  Created by Islam Soliman on 1/15/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class DrCoffeeStoresDB {
    var Stores = [NSManagedObject]()
    let managedContext = DataController().managedObjectContext
    static let sharedInstance = DrCoffeeStoresDB()
    
    func getAllStores(updatable : Updatable) {
        
        let fetchRequest = NSFetchRequest(entityName: "DrCoffeeStores")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            Stores = results as! [NSManagedObject]
            updatable.update("")
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    func saveStore(store: DrCoffeeStores ) {
   
          let entity =  NSEntityDescription.entityForName("DrCoffeeStores",
                                                                inManagedObjectContext:managedContext)
        
           let stores = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)

            stores.setValue(store.latitude, forKey: "latitude")
            stores.setValue(store.longitude, forKey: "longitude")
            
            
            do {
                try managedContext.save()
                Stores.append(store)
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
    }
 
       
      
    
    
}
