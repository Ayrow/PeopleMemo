//
//  PersonDetailView.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 20/03/2023.
//

import SwiftUI

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        VStack {
            Image(uiImage: person.wrappedPhoto)
                .resizable()
                .scaledToFill()
            
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
