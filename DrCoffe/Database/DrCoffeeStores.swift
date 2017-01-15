//
//  StoresModel.swift
//  DrCoffe
//
//  Created by Islam Soliman on 1/15/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import Foundation
import CoreData

@objc(DrCoffeeStores)
class  DrCoffeeStores : NSManagedObject {
    @NSManaged var latitude : String?
    @NSManaged var longitude : String?
    
    
    
}
