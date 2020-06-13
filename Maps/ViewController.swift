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
    
    let pointerTitle = "Opera House"
    let pointerSubtitle = "Centro de artes histórico de referência na cidade para ópera, teatro, música e dança, além de tours guiados."
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMaps()
    }
    
    private func initMaps() {
        map.setRegion(getRegion(), animated: true)
        map.addAnnotation(getPointer())
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
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        
        return MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
    }
    
    private func getPointer() -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = getCoordinates()
        annotation.title = pointerTitle
        annotation.subtitle = pointerSubtitle
        
        return annotation
    }

}

