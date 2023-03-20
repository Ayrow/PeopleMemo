//
//  ContentView-ViewModel.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 20/03/2023.
//

import Foundation

extension ContentView {
    
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var people: [Person]
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPeople")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                people = try JSONDecoder().decode([Person].self, from: data)
            } catch {
                people = []
            }
        }
        
        
        
    }
    
}
