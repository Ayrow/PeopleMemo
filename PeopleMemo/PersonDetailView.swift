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
    @State private var selectedPicker = 0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
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
                Map(coordinateRegion: $region)
            }
            
            
            
            
            
            Text(person.name)
                .font(.largeTitle.bold())
            
        }
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Person.example)
    }
}
