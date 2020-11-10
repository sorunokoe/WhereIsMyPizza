//
//  MapView.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import CoreLocation
import MapKit

extension MKMapView {
    func centerToLocation(_ location: CLLocation,
                          regionRadius: CLLocationDistance = 10000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
