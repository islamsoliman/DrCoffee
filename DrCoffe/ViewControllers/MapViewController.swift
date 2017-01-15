//
//  MapViewController.swift
//  DrCoffe
//
//  Created by Islam Soliman on 1/11/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import Foundation
class MapViewController : UIViewController ,Updatable{
    var locationManager = CLLocationManager()
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        mapView.delegate = self
        getLocation()
        StoresViewModel.sharedInstance.saveStores()
        DrCoffeeStoresDB.sharedInstance.getAllStores(self)
       
        
    }
    
    
    func getLocation(){
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }else{
            self.presentViewController(AlertHelper.factoryFor(.GPSDenied), animated: true, completion: nil)
            
        }
    }
    func update(apiName: String) {
        for store in DrCoffeeStoresDB.sharedInstance.Stores {
              let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(Double(store.valueForKey("latitude") as! String)!,Double( store.valueForKey("longitude") as! String)!)
            marker.icon = UIImage(named: "mapIcon")
            marker.map = mapView

        }
        
    }

    }
