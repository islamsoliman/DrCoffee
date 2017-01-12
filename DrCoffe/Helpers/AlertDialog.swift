//
//  AlertDialog.swift
//
//
//  Created by Islam Soliman on 1/10/17.
//  Copyright © 2015 Islam Soliman. All rights reserved.
//

import Foundation
import UIKit
class AlertDialog
{
    
    var context: UIViewController?
    static var sharedInstance = AlertDialog()
    
   
    /**
     Show UIAlertViewController with passed parameters inside context view controller
     
     - parameter context: View controller to present alert view inside
     - parameter title:   Alert view's title
     - parameter message: Presented Message in the alert view 
     */
    func showAlert( context : UIViewController,title : String ,message : String){
         self.context = context
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction!) in
           
        }
        alertController.addAction(OKAction)
        
        context.presentViewController(alertController, animated: true, completion:nil)
    }
    
    
}
