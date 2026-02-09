//
//  SubBreedDetail_View.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 08/02/26.
//

import SwiftUI

struct SubBreedDetail_View: View {
    let breed: String
    let subBreed: String
    
    @StateObject var viewModel: SubBreedDetail_ViewModel
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            } else {
                Text(subBreed)
                ScrollView(.horizontal) {
                                      
                    LazyHStack(spacing: 16) {
                        ForEach(viewModel.imageURLs, id: \.self) { imageUrl in
                            showImageView(url: imageUrl)
                        }
                    }
                    .padding()
                    
                }
            }
        }
        .navigationTitle(breed)
        .task {
            await viewModel.loadImage(breed: breed, subBreed: subBreed)
        }
    }
    
    private func showImageView(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
        } placeholder: {
            ProgressView()
        }
    }
}
