//
//  ContentView-ViewModel.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 20/03/2023.
//

import UIKit
import MapKit

extension ContentView {
    
    @MainActor class ViewModel: ObservableObject {
        
        @Published private(set) var people: [Person]
        @Published var selectedPhoto: UIImage?
        @Published var showImagePicker = false
        @Published var showEditSheet = false
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPeople")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                people = try JSONDecoder().decode([Person].self, from: data)
            } catch {
                people = []
            }
        }
        
        
        func save() {
            do {
                let data = try JSONEncoder().encode(people)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        func addPerson(newPerson: Person) {
            people.append(newPerson)
            save()
        }
       
        
        
    }
    
}
