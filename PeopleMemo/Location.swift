//
//  Location.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 21/03/2023.
//

import CoreLocation
import Foundation

struct Location: Codable, Equatable {
    var id: UUID
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(id: UUID(), latitude: 51.501, longitude: -0.141)
    
}
