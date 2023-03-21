//
//  PersonDetailView.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 20/03/2023.
//

import MapKit
import SwiftUI

struct PersonDetailView: View {
    var person: Person
    var mapLocation: CLLocationCoordinate2D
    
    @State private var selectedPicker = 0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let annotation = [
        Location(id: UUID(), latitude: 51.507222, longitude: -0.1275)
       ]
    
    private let tab = ["Photo", "Location"]
    
    var body: some View {
        NavigationStack {
            Picker("", selection: $selectedPicker) {
                Text("Photo").tag(0)
                Text("Location").tag(1)
            }
            .pickerStyle(.segmented)
            
            if selectedPicker == 0 {
                Image(uiImage: person.wrappedPhoto)
                    .resizable()
                    .scaledToFill()
            } else {
                Map(coordinateRegion: $region, annotationItems: annotation) {_ in
                    MapMarker(coordinate: mapLocation)
                }
                
            }
            
            Text(person.name)
                .font(.largeTitle.bold())
            
        }
        .onAppear {
            region = MKCoordinateRegion(center: mapLocation, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        }
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Person.example, mapLocation: Location.example.coordinate)
    }
}
