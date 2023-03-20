//
//  ContentView.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 20/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.people) { person in
                    HStack {
                        Text(person.name)
                        Image(uiImage: person.photo ?? UIImage(systemName: "person.crop.square")!)
                    }
                }
            }
            .navigationTitle("People Memo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showImagePicker = true
                    } label: {
                        Label("Add image", systemImage: "plus")
                    }

                }
            }
            .onChange(of: viewModel.selectedPhoto) { _ in
                viewModel.showEditSheet.toggle()
            }
            .sheet(isPresented: $viewModel.showImagePicker) {
                ImagePicker(image: $viewModel.selectedPhoto)
            }
            .sheet(isPresented: $viewModel.showEditSheet) {
                // TODO: add the edit view
                }
            }
        }
    
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
