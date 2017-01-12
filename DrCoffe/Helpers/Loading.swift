//
//  Loading.swift
//  WaveInsure
//
//  Created by Islam Soliman on 1/10/17
//  Copyright © 2015 Islam Soliman. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
class Loading
{
    static var sharedInstance = Loading()
    
    /**
     Show loading indicator
     */
    func showLoading(){
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        //PKHUD.sharedHUD.contentView = PKHUDTextView( text: "Loading...)
        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
        PKHUD.sharedHUD.show()
    }
    
    /**
     Hide loading indicator
     */
    func dismissLoading()
    {
        PKHUD.sharedHUD.hide(animated: true, completion: nil)
    }
    
}
