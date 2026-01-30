//
//  DogListView.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import SwiftUI

struct DogListView: View {
    @StateObject var viewModel: DogListViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                } else {
                    List(viewModel.dogBreeds, id: \.self) { dogBreed in
                        Text(dogBreed)
                    }
                }
            }
            .navigationTitle("Dog Breeds")
            .task {
                await viewModel.loadDogBreeds()
            }
        }
    }
}
