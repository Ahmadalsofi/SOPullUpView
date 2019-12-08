//
//  LocationsDummyData.swift
//  SOPullUpView_Example
//
//  Created by Ahmad Sofi on 12/8/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import MapKit

struct Location {

    var locations = [(title: String, location: CLLocationCoordinate2D)]()
    
    init() {
        setupDataSource()
    }
    
    private mutating func setupDataSource() {
           locations.append(("Rome", CLLocationCoordinate2D(latitude: 41.9004041, longitude: 12.4432921)))
           locations.append(("Milan", CLLocationCoordinate2D(latitude: 45.4625319, longitude: 9.1574741)))
           locations.append(("Turin", CLLocationCoordinate2D(latitude: 45.0705805, longitude: 7.6593106)))
           locations.append(("London", CLLocationCoordinate2D(latitude: 51.5287718, longitude: -0.2416817)))
           locations.append(("Paris", CLLocationCoordinate2D(latitude: 48.8589507, longitude: 2.2770201)))
           locations.append(("Amsterdam", CLLocationCoordinate2D(latitude: 52.354775, longitude: 4.7585401)))
           locations.append(("Dublin", CLLocationCoordinate2D(latitude: 53.3244431, longitude: -6.3857869)))
           locations.append(("Reykjavik", CLLocationCoordinate2D(latitude: 64.1335484, longitude: -21.9224815)))
           locations.append(("London", CLLocationCoordinate2D(latitude: 51.5287718, longitude: -0.2416817)))
           locations.append(("Paris", CLLocationCoordinate2D(latitude: 48.8589507, longitude: 2.2770201)))
           locations.append(("Amsterdam", CLLocationCoordinate2D(latitude: 52.354775, longitude: 4.7585401)))
           locations.append(("Dublin", CLLocationCoordinate2D(latitude: 53.3244431, longitude: -6.3857869)))
           locations.append(("Reykjavik", CLLocationCoordinate2D(latitude: 64.1335484, longitude: -21.9224815)))
           locations.append(("London", CLLocationCoordinate2D(latitude: 51.5287718, longitude: -0.2416817)))
           locations.append(("Paris", CLLocationCoordinate2D(latitude: 48.8589507, longitude: 2.2770201)))
           locations.append(("Amsterdam", CLLocationCoordinate2D(latitude: 52.354775, longitude: 4.7585401)))
           locations.append(("Dublin", CLLocationCoordinate2D(latitude: 53.3244431, longitude: -6.3857869)))
           locations.append(("Reykjavik", CLLocationCoordinate2D(latitude: 64.1335484, longitude: -21.9224815)))
       }
}
