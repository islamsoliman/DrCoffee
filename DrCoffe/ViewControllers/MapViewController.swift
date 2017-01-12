//
//  MapViewController.swift
//  DrCoffe
//
//  Created by Islam Soliman on 1/11/17.
//  Copyright © 2017 Islam Soliman. All rights reserved.
//

import Foundation
class MapViewController : UIViewController{
    var locationManager = CLLocationManager()
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        mapView.delegate = self
        getLocation()
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(30.057078,31.345603)
        marker.map = mapView

        
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
    
    }
