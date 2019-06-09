//
//  MapsViewController.swift
//  MobileRNDAssignment
//
//  Created by Deni Smilevska on 6/8/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController, CitySelectedDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - CitySelectedProtocol func
    
    func citySelected(city: City) {
        let location = CLLocation(latitude: city.coord.lat, longitude: city.coord.lon)
        self.centerMapOnLocation(location: location)
    }
    
    //MARK: - Map fucntions
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius : CLLocationDistance = 10000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
