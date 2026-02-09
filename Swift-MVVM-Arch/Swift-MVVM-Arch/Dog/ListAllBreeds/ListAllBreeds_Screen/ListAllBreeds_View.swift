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
                    List {
                        ForEach(viewModel.allBreeds) { breed in
                            
                            Section(breed.breedName) {
                                ForEach(breed.subBreeds, id: \.self) { subBreed in
                                    
                                    NavigationLink {
                                        SubBreedDetail_View(breed: breed.breedName, subBreed: subBreed)
                                    } label: {
                                        Text(subBreed)
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Dog Breeds")
            .task {
                await viewModel.loadAllBreedsData()
            }
        }
    }
}
