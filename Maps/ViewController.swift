//
//  ViewController.swift
//  Maps
//
//  Created by Natan Brito on 13/06/20.
//  Copyright © 2020 Natan Brito. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMaps()
    }
    
    private func initMaps() {
        map.setRegion(getRegion(), animated: true)
    }

    private func getRegion() -> MKCoordinateRegion {
        return MKCoordinateRegion.init(center: getCoordinates(), span: getCoordinateSpan())
    }
    
    private func getCoordinates() -> CLLocationCoordinate2D {
        let latitude = -33.856565
        let longitude = 151.215279
        
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    //FUNCTION RESPONSABLE FOR DEFINE THE MAP ZOOM
    private func getCoordinateSpan() -> MKCoordinateSpan {
        let deltaLatitude: CLLocationDegrees = 0.001
        let deltaLongitude: CLLocationDegrees = 0.001
        
        return MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
    }

}

