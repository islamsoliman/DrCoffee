//
//  RegisterationViewController.swift
//  
//
//  Created by Islam Soliman on 1/10/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import Foundation
import CoreData
class RegisterationViewController: UIViewController , Updatable {
    
    @IBOutlet weak var retypePassTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var genderSegmented: UISegmentedControl!
    @IBOutlet weak var passwordTextField: UITextField!
    var gender : String = "Male"
    var userModel = UserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        self.title = "SignIn"
        backgroundView.layer.shouldRasterize = true
        // No setting rasterizationScale, will cause blurry images on retina.
        backgroundView.layer.rasterizationScale =  UIScreen.mainScreen().scale
        self.backgroundView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)

        leftBtn()
 
    
    }
    
    func leftBtn(){
        let btnName = UIButton()
        btnName.setImage(UIImage(named: "back"), forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 30, 30)
        btnName.addTarget(self, action: #selector(backBtn), forControlEvents: .TouchUpInside)        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName
        self.navigationItem.leftBarButtonItem = rightBarButton
        
        
    }
    func backBtn(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func register(sender: AnyObject) {
        
        let username = usernameTextField.text
        let password = passwordTextField.text
        let phone = phoneTextField.text
        let email = emailTextField.text
        let retypePass = retypePassTextField.text

        if !username!.isEmpty && !password!.isEmpty && !phone!.isEmpty && !email!.isEmpty && !retypePass!.isEmpty  {
            if retypePass == password {
            let userModel:Users = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: DataController().managedObjectContext) as! Users
            userModel.setValue("", forKey: "iD")
            userModel.setValue(username, forKey: "userName")
            userModel.setValue(password, forKey: "passWord")
            userModel.setValue(phone, forKey: "phone")
            userModel.setValue(gender, forKey: "gender")
            userModel.setValue(email, forKey: "email")
            
            Loading.sharedInstance.showLoading()
            UsersDB.sharedInstance.saveUser(userModel , updatable: self)
            
            
            }else{
                AlertDialog.sharedInstance.showAlert(self, title: "", message: "PassWord doesnt match Retype PassWord")

            }
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

    @IBAction func genderClick(sender: AnyObject) {
        
        switch genderSegmented.selectedSegmentIndex
        {
        case 0:
            gender = "Male";
        case 1:
            gender = "Female";
        default:
            break; 
        } 

    }
    
    func update(apiName: String) {
        Loading.sharedInstance.dismissLoading()

        navigate()
    }
   }
