//
//  ListAllBreeds_View.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import SwiftUI

struct ListAllBreeds_View: View {
    @StateObject var viewModel: ListAllBreeds_ViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                } else {
                    List(viewModel.allBreeds, id: \.self) { dogBreed in
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
