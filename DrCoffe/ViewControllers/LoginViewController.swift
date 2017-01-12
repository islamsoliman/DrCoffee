//
//  LoginViewController.swift
//  
//
//  Created by Islam Soliman on 1/10/17.
//  Copyright © 2017 Islam Soliman . All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, Updatable {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        self.title = "LogIn"

        backGroundView.layer.shouldRasterize = true
        // No setting rasterizationScale, will cause blurry images on retina.
        backGroundView.layer.rasterizationScale =  UIScreen.mainScreen().scale
        self.backGroundView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.layer.borderColor = UIColor(netHex:0x212C42).CGColor
        passwordTextField.layer.borderColor = UIColor(netHex:0x212C42).CGColor
        
        leftBtn()


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func login(sender: UIButton) {
        let username = userNameTextField.text
        let password = passwordTextField.text
        
        if !(username?.isEmpty)! && !(password?.isEmpty)!{
            Loading.sharedInstance.showLoading()

             UsersDB.sharedInstance.searchByUserNameAndPass(username!, pass: password! ,updatable: self )
        
        }else{
            AlertDialog.sharedInstance.showAlert(self, title: "", message: "Insert All Fields")
                    }
    }
  
    func navigate(){
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : UITabBarController = storyboard.instantiateViewControllerWithIdentifier("tabViewController") as! UITabBarController
        let nav = MainNavigationViewController(rootViewController: vc)
        
        self.presentViewController(nav, animated: true, completion: nil)
        
       
           }

    
       func leftBtn(){
        let btnName = UIButton()
        btnName.setImage(UIImage(named: "back"), forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 30, 30)
        btnName.addTarget( self , action: #selector(backBtn), forControlEvents: .TouchUpInside)        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName
        self.navigationItem.leftBarButtonItem = rightBarButton
        
        
    }
    
    func backBtn(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    func update(apiName: String) {
        Loading.sharedInstance.dismissLoading()
        navigate()
    }
}

