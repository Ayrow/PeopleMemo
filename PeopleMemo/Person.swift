//
//  People.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 20/03/2023.
//

import CoreLocation
import UIKit
import SwiftUI

struct Person: Identifiable, Codable, Comparable {
    var id: UUID
    var name: String
    var photo: UIImage?
    var location: Location
    
    var wrappedPhoto: UIImage {
        photo ?? UIImage(systemName: "person.crop.square")!
    }
    
    static let example = Person(id: UUID(), name: "John", photo: UIImage(imageLiteralResourceName: "Example"), location: Location.example)

    enum CodingKeys: CodingKey {
        case id, name, photo, location
    }
    
    init(id: UUID, name: String, photo: UIImage?, location: Location) {
        self.id = id
        self.name = name
        self.photo = photo
        self.location = location
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        let photoData = try container.decode(Data.self, forKey: .photo)
        self.photo = UIImage(data: photoData)
        self.location = try container.decode(Location.self, forKey: .location)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        let photoData = photo?.jpegData(compressionQuality: 0.8)
        try container.encode(photoData, forKey: .photo)
        try container.encode(location, forKey: .location)
    }
    
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }

    
}




