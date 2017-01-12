//
//  HomeViewController.swift
//  DrCoffe
//
//  Created by Islam Soliman on 1/11/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import Foundation

class HomeViewController: UIViewController  , UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
   
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var belowCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.topCollectionView.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "Cell")

        
        topCollectionView!.backgroundColor = UIColor.blackColor()
        self.view.addSubview(topCollectionView!)
        
        
        self.topCollectionView.reloadData()
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        
        self.belowCollectionView.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "Cell")
        
        
        belowCollectionView!.backgroundColor = UIColor.blackColor()
        self.view.addSubview(topCollectionView!)
        
        
        self.belowCollectionView.reloadData()
        belowCollectionView.delegate = self
        belowCollectionView.dataSource = self
        
        topCollectionView.layer.shouldRasterize = true
        topCollectionView.layer.rasterizationScale =  UIScreen.mainScreen().scale
        self.topCollectionView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        
        belowCollectionView.layer.shouldRasterize = true
        belowCollectionView.layer.rasterizationScale =  UIScreen.mainScreen().scale
        self.belowCollectionView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == topCollectionView){
            return 1

        }else{
            return 1

        }
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if(collectionView == topCollectionView){
            return 2
            
        }else{
            return 3
            
        }

    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if(collectionView == topCollectionView){
            if indexPath.section == 1 {
            self.tabBarController?.selectedIndex = 1
            }
        }
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
      
        if collectionView == topCollectionView
      {
    
        if indexPath.section == 0{
            cell.dayNameLabel.text = "Order & Pickup"
            cell.selectionView.image = UIImage(named: "order")
        }else{
            cell.dayNameLabel.text = "Find our Store"
            cell.selectionView.image = UIImage(named: "ourStore")

        }
    }
      else{
            if indexPath.section == 0{
                cell.dayNameLabel.text = "Messages"
                cell.selectionView.image = UIImage(named: "messageImage")

            }else if indexPath.section == 1{
                cell.dayNameLabel.text = "Menu"
                cell.selectionView.image = UIImage(named: "menuImage")

            }else{
                cell.dayNameLabel.text = "Favourites"
                cell.selectionView.image = UIImage(named: "favorites")

            
            }
        }
        cell.selectionView.image = cell.selectionView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        cell.selectionView.tintColor = UIColor.whiteColor()
        
        
               return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size : CGSize
        if(collectionView == topCollectionView){
          size = CGSize(width: ((collectionView.frame.size.width-collectionView.frame.origin.x) / 2.0), height: 100)
        }else{
            size = CGSize(width: ((collectionView.frame.size.width-collectionView.frame.origin.x) / 3.0), height: 100)
            
        }

 
        print("Size cell day width is \(collectionView.frame.size.width-collectionView.frame.origin.x / 2.0)")
        
        return size;
    }
    
    
}
