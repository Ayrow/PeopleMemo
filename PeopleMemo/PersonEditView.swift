//
//  PersonEditView.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 20/03/2023.
//

import SwiftUI

struct PersonEditView: View {
    @Environment(\.dismiss) var dismiss
    
    var person: Person
    var onSave: (Person) -> Void
    @State private var name: String
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: person.photo ?? UIImage(systemName: "person.crop.square")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                TextField("Enter a name", text: $name)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    
                
            }
            .navigationTitle("Edit Person")
            .toolbar {
                ToolbarItem {
                    Button("Save"){
                        var newPerson = person
                        newPerson.id = person.id
                        newPerson.name = name
                        newPerson.photo = person.photo
                        
                        onSave(newPerson)
                        dismiss()
                    }
                }
            }
        }
    }
    
    init(person: Person, onSave: @escaping (Person) -> Void) {
        self.person = person
        self.onSave = onSave
        
        _name = State(initialValue: person.name)
    }
}

struct PersonEditView_Previews: PreviewProvider {
    static var previews: some View {
        PersonEditView(person: Person.example) { _ in}
    }
}
