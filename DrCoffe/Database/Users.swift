//
//  User.swift
//
//
//  Created by Islam Soliman on 1/10/17
//  Copyright © 2017 Islam Soliman . All rights reserved.
//

import Foundation
import CoreData

@objc(Users)
class  Users : NSManagedObject {
   @NSManaged var iD : String?
   @NSManaged var userName : String?
   @NSManaged var passWord : String?
   @NSManaged var email : String?
   @NSManaged var phone : String?
   @NSManaged var gender : String?
    
    
}
