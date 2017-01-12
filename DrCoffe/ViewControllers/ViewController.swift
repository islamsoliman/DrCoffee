//
//  ViewController.swift
//  DrCoffe
//
//  Created by Islam Soliman on 1/10/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backGroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Dr.Coffee"
        backGroundView.layer.shouldRasterize = true
        // No setting rasterizationScale, will cause blurry images on retina.
        backGroundView.layer.rasterizationScale =  UIScreen.mainScreen().scale
        self.backGroundView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

