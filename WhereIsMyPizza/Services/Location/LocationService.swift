//
//  LocationService.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import Foundation
import CoreLocation

protocol LocationServiceProtocol: CLLocationManagerDelegate {
    var location: Box<CLLocationCoordinate2D?> { get }
    func getCurrentLocation()
}
class LocationService: NSObject, LocationServiceProtocol {
    
    var location: Box<CLLocationCoordinate2D?> = Box(nil)

    private let locationManager = CLLocationManager()
    
    func getCurrentLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        location.value = locValue
    }
}
