//
//  ContentView.swift
//  PeopleMemo
//
//  Created by Aymeric Pilaert on 20/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showImagePicker = false
    
    var body: some View {
        NavigationStack {
            VStack {
                image?
                    .resizable()
                    .scaledToFit()
                
                Text("Hello, world!")
            }
            .navigationTitle("People Memo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showImagePicker = true
                    } label: {
                        Label("Add image", systemImage: "plus")
                    }

                }
            }
            .onChange(of: inputImage) { _ in
                loadImage()
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
