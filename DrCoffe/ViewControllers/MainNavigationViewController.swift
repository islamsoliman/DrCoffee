//
//  MainNavigationViewController.swift
//
//
//  Created by Islam Soliman
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor(netHex:0x212C42)

        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    
    }
    
    
}
