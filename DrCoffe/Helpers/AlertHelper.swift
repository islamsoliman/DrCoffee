
import UIKit

class AlertHelper {
    enum AlertType {
        case GPSDenied
    }
    
    class func factoryFor(type : AlertType) -> UIAlertController {
        var title:String!
        var message:String!
        let settingsAction:UIAlertAction!
        
        switch type {
        case .GPSDenied:
            title = "Mal3abi"
            message = "Please Enable location services, Go to Settings > Privacy > Location Services > Enable Location Services."
           // cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            settingsAction = UIAlertAction(title: "OK", style: .Default, handler: { action in
               // let url:NSURL = NSURL(string:"prefs://")!
            //UIApplication.sharedApplication().openURL(url)
            })
            break
       
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        //alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        return alertController
    }
}
