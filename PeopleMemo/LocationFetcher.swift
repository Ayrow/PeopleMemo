//
//  LocationFetcher.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 21/03/2023.
//

import Foundation
import CoreLocation

class LocationFetcher: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?
    
    var wrappedLastKnownLocation: CLLocationCoordinate2D {
        lastKnownLocation ?? CLLocationCoordinate2D(latitude: 50, longitude: 50)
    }

    override init() {
        super.init()
        manager.delegate = self
    }

    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
    
}
