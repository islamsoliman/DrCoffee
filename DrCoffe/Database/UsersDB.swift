//
//  Users.swift
//
//
//  Created by Islam Soliman on 1/10/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UsersDB {
    var playgrounds = [NSManagedObject]()
    let managedContext = DataController().managedObjectContext
    static let sharedInstance = UsersDB()
   
    func searchByUserNameAndPass(userName : String , pass : String , updatable : Updatable) -> Bool {
        let fetchRequest = NSFetchRequest(entityName: "Users")
        let predicate = NSPredicate(format: "userName == %@ AND passWord == %@", argumentArray:[userName,pass])
        fetchRequest.predicate = predicate

        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            if(results.count > 0  ){
            updatable.update("")
            return true
                
            }else{
            return false
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

    return false
    }
    func getAllUsers() {
        
        let fetchRequest = NSFetchRequest(entityName: "Users")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            playgrounds = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func deleteById(id: String){
        let fetchRequest = NSFetchRequest(entityName:"Users")
        fetchRequest.predicate = NSPredicate(format: "iD == %@", id)
        do
        {
            let fetchedResults =  try managedContext.executeFetchRequest(fetchRequest)
            
            for entity in fetchedResults {
                
                managedContext.deleteObject(entity as! NSManagedObject)
               try managedContext.save()
            }
        }
        catch _ {
            print("Could not delete")
            
        }

            }

    
    func saveUser(user: Users , updatable : Updatable) {
        
        let entity =  NSEntityDescription.entityForName("Users",
                                                        inManagedObjectContext:managedContext)
        
        let client = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        client.setValue(user.userName, forKey: "userName")
        client.setValue(user.iD, forKey: "iD")
        client.setValue(user.passWord, forKey: "passWord")
        client.setValue(user.email, forKey: "email")
        client.setValue(user.phone, forKey: "phone")
        client.setValue(user.gender, forKey: "gender")
 

        do {
            try managedContext.save()
            playgrounds.append(client)
            updatable.update("")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

}
