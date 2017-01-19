//
//  OrdersViewController.swift
//  DrCoffe
//
//  Created by Islam Soliman on 1/18/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UITableViewDataSource, UITableViewDelegate {
    var sections = [Section]()
    var collection = [String]()

    @IBOutlet weak var ordersTableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
         ordersTableView.dataSource = self
        ordersTableView.delegate = self
         collectionView.dataSource = self
        collectionView.delegate = self
        ordersTableView.sectionHeaderHeight = 0
        
        // Do any additional setup after loading the view.
        sections = [
            Section(name: "Espresso", items: ["Espresso Frape", "Espresso Caffee", "Caffee1", "Caffee2", "Caffee2"] , numberOFOrders:["0", "0", "0", "0", "0"]),
            Section(name: "Espresso With Add", items: ["Espresso Frape", "Espresso Caffee", "Caffee1", "Caffee2", "Caffee2"], numberOFOrders:["0", "0", "0", "0", "0"]),

            Section(name: "Kids Hot", items: ["Espresso Frape", "Espresso Caffee", "Caffee1", "Caffee2", "Caffee2"], numberOFOrders:["0", "0", "0", "0", "0"]),

            Section(name: "Kids Hot", items: ["Espresso Frape", "Espresso Caffee", "Caffee1", "Caffee2", "Caffee2"], numberOFOrders:["0", "0", "0", "0", "0"]),

            Section(name: "Frape", items: ["Espresso Frape", "Espresso Caffee", "Caffee1", "Caffee2", "Caffee2"], numberOFOrders:["0", "0", "0", "0", "0"]),

            Section(name: "Kids Hot", items: ["Espresso Frape", "Espresso Caffee", "Caffee1", "Caffee2", "Caffee2"], numberOFOrders:["0", "0", "0", "0", "0"]),

            Section(name: "Espresso With Add", items: ["Espresso Frape", "Espresso Caffee", "Caffee1", "Caffee2", "Caffee2"], numberOFOrders:["0", "0", "0", "0", "0"]),

            Section(name: "Espresso", items: ["Espresso Frape", "Espresso Caffee", "Caffee1", "Caffee2", "Caffee2"], numberOFOrders:["0", "0", "0", "0", "0"]),

            Section(name: "Kids Hot", items: ["Espresso Frape", "Espresso Caffee", "Caffee1", "Caffee2", "Caffee2"], numberOFOrders:["0", "0", "0", "0", "0"]),

        ]
       collection = ["Beverage","Food","Snacks","Beans","Beverage"]
    /*

         
         {"Categories":[{
         
         "Beverages":[{"Espresso":["Espresso Frape","Espresso Caffee" ,"Caffee1","Caffee2" ] }
         ,{"Espresso With Add":[ "Espresso Frape","Espresso Caffee" ,"Caffee1","Caffee2" ] },
         {"Kids Hot":[ "Espresso Frape","Espresso Caffee" ,"Caffee1","Caffee2" ] },
         {"Frape":[ "Espresso Frape","Espresso Caffee" ,"Caffee1","Caffee2" ] }
         
         ]},
         {
         "Food":[{"Espresso":["Espresso Frape","Espresso Frape"]}]},
         {
         "Snacks":[{"Espresso":["Espresso Frape","Espresso Frape"]}]},
         {
         "Beans":[{"Espresso":["Espresso Frape","Espresso Frape"]}]}
         
         
         ]
         
         
         
         
         
         }

         
         
         */
    }
    override func viewDidAppear(animated: Bool) {
        collectionView.selectItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.Right)
        self.collectionView(collectionView, didSelectItemAtIndexPath : NSIndexPath(forItem: 0, inSection: 0))
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return collection.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell" , forIndexPath: indexPath) as! OrderCollectionViewCell
        cell.collectionLbl.text = collection[indexPath.row]
 return cell

    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let dayCell = collectionView.cellForItemAtIndexPath(indexPath)
        if (dayCell != nil) {
            (dayCell as! OrderCollectionViewCell).collectionLbl.textColor = UIColor.yellowColor()
            // reload schedule details
            ordersTableView.reloadData()
        }
        
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let dayCell = collectionView.cellForItemAtIndexPath(indexPath)
        if (dayCell != nil) {
            (dayCell as! OrderCollectionViewCell).collectionLbl.textColor = UIColor.whiteColor()
            // reload schedule details
            ordersTableView.reloadData()
        }
        

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        print("Size cell day width is \(collectionView.frame.size.width-collectionView.frame.origin.x / 7.0)")
        let size = CGSize(width: ((collectionView.frame.size.width-collectionView.frame.origin.x) / 6), height: 30)
        return size;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            // Calculate the real section index and row index
            let section = getSectionIndex(indexPath.row)
            let row = getRowIndex(indexPath.row)
            
        if row == 0{
        let cell = tableView.dequeueReusableCellWithIdentifier("header", forIndexPath: indexPath) as! HeaderCell
                cell.headerTitle.text = sections[section].name
                cell.toggleBtn.tag = section
                cell.toggleBtn.setTitle(sections[section].collapsed! ? "+" : "-", forState: .Normal)
                cell.toggleBtn.addTarget(self, action: #selector(OrdersViewController.toggleCollapse), forControlEvents: .TouchUpInside)
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath) as! ExpandCell
                cell.productName.text = sections[section].items[row - 1]
                cell.makeOrderView.layer.borderWidth = 1
                
                cell.makeOrderView.layer.borderColor = UIColor.yellowColor().CGColor
                cell.makeOrderView.tag = indexPath.row
               let tap = UITapGestureRecognizer(target: self, action: #selector(makeOrderViewClick))
                cell.makeOrderView.addGestureRecognizer(tap)
                cell.numberOfOrders.text = sections[section].numberOFOrders[row - 1]
                return cell
            }
        }
    
    
    func makeOrderViewClick(sender:UITapGestureRecognizer){
        
        let section = getSectionIndex((sender.view! as UIView).tag)
        let row = getRowIndex((sender.view! as UIView).tag)
        if row != 0 {
         let cell = ordersTableView.cellForRowAtIndexPath(NSIndexPath(forRow: (sender.view! as UIView).tag  , inSection: 0))

        if (cell != nil) {
           let num =  Int(sections[section].numberOFOrders[row - 1 ])
            (cell as! ExpandCell).numberOfOrders.text = String(num! + 1)
            sections[section].numberOFOrders[row - 1] = String(num! + 1)
            }
    }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = sections.count
        
        for section in sections {
            count += section.items.count
        }
        
        return count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
              // Calculate the real section index and row index
              let section = getSectionIndex(indexPath.row)
             let row = getRowIndex(indexPath.row)
        
               // Header has fixed height
              if row == 0 {
                  return 50.0
              }
       
              return sections[section].collapsed! ? 0 : 60.0
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct Section {
        var name: String!
        var items: [String ]!
        var numberOFOrders: [String]!

        var collapsed: Bool!
        
        init(name: String, items: [String], numberOFOrders: [String],collapsed: Bool = false) {
            self.name = name
            self.items = items
            self.numberOFOrders = numberOFOrders

            self.collapsed = collapsed
        }
    }
    

    
    //
    // MARK: - Event Handlers
    //
    func toggleCollapse(sender: UIButton) {
        let section = sender.tag
        let collapsed = sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = !collapsed
        
        let indices = getHeaderIndices()
        
        let start = indices[section]
        let end = start + sections[section].items.count
        
        ordersTableView.beginUpdates()
        for i in start ..< end + 1 {
            ordersTableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: i, inSection: 0)], withRowAnimation: .Automatic)
        }
        ordersTableView.endUpdates()
    }
    

    
    
    //
    // MARK: - Helper Functions
    //
    func getSectionIndex(row: NSInteger) -> Int {
        let indices = getHeaderIndices()
        
        for i in 0..<indices.count {
            if i == indices.count - 1 || row < indices[i + 1] {
                return i
            }
        }
        
        return -1
    }
    
    func getRowIndex(row: NSInteger) -> Int {
        var index = row
        let indices = getHeaderIndices()
        
        for i in 0..<indices.count {
            if i == indices.count - 1 || row < indices[i + 1] {
                index -= indices[i]
                break
            }
        }
        
        return index
    }
    
    func getHeaderIndices() -> [Int] {
        var index = 0
        var indices: [Int] = []
        
        for section in sections {
            indices.append(index)
            index += section.items.count + 1
        }
        
        return indices
    }
    
}
