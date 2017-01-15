//
//  StoresViewModel.swift
//  DrCoffe
//
//  Created by Islam Soliman on 1/15/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import Foundation
import CoreData
class StoresViewModel {
    static let sharedInstance = StoresViewModel()

    func saveStores(){
        let url = NSBundle.mainBundle().URLForResource("data", withExtension: "json")
        let data = NSData(contentsOfURL: url!)

        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                readJSONObject(dictionary)
            }
        } catch {
            // Handle Error
        }
    
    }
   
    func readJSONObject(object: [String: AnyObject]) {
        
        let stores = object["DrCoffeeStores"] as? [[String: String]]
        
        for store in stores! {
            guard let lat = store["lat"] ,
                let long = store["long"]  else { break }
            let storesModel : DrCoffeeStores = NSEntityDescription.insertNewObjectForEntityForName("DrCoffeeStores", inManagedObjectContext: DataController().managedObjectContext) as! DrCoffeeStores
         
            storesModel.setValue(lat, forKey: "latitude")
            storesModel.setValue(long, forKey: "longitude")
            DrCoffeeStoresDB.sharedInstance.saveStore(storesModel)
        }
    }
}
