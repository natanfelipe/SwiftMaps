//
//  ViewController.swift
//  Maps
//
//  Created by Natan Brito on 13/06/20.
//  Copyright © 2020 Natan Brito. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let pointerTitle = "Opera House"
    let pointerSubtitle = "Centro de artes histórico de referência na cidade para ópera, teatro, música e dança, além de tours guiados."
    
    @IBOutlet weak var map: MKMapView!
    var locationMananger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        initMaps(location: locations.last!)
    }
    
    private func initMaps(location: CLLocation) {
        map.setRegion(getRegion(location: location), animated: true)
        //map.addAnnotation(getPointer(location: location))
    }
    
    private func getLocation() {
        locationMananger.delegate = self
        locationMananger.desiredAccuracy = kCLLocationAccuracyBest
        locationMananger.requestWhenInUseAuthorization()
        locationMananger.startUpdatingLocation()
    }

    private func getRegion(location: CLLocation) -> MKCoordinateRegion {
        return MKCoordinateRegion.init(center: getCoordinates(location: location), span: getCoordinateSpan())
    }
    
    private func getCoordinates(location: CLLocation) -> CLLocationCoordinate2D {
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    
    //FUNCTION RESPONSABLE FOR DEFINE THE MAP ZOOM
    private func getCoordinateSpan() -> MKCoordinateSpan {
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        
        return MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
    }
    
    private func getPointer(location: CLLocation) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = getCoordinates(location: location)
        annotation.title = pointerTitle
        annotation.subtitle = pointerSubtitle
        
        return annotation
    }

}

