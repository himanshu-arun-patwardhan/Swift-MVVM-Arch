//
//  ListAllBreeds_ViewModel.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import Foundation
import Combine

@MainActor
class ListAllBreeds_ViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var allBreeds: [DogBreed] = []
    
    let apiService: ListAllBreeds_APIServiceProtocol
    
    init(apiService: ListAllBreeds_APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func loadAllBreedsData() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await apiService.fetchAllBreeds()
            allBreeds = makeStructuredData(response)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    private func makeStructuredData(_ allBreeds: [String: [String]]) -> [DogBreed] {
        return allBreeds
            .map { breed, subBreeds in
                DogBreed(
                    id: breed,
                    breedName: breed.capitalized,
                    subBreeds: subBreeds.isEmpty ? ["No sub-breed"] : subBreeds
                )
            }
            .sorted{ $0.breedName < $1.breedName }
    }
}

struct DogBreed: Identifiable {
    let id: String
    let breedName: String
    let subBreeds: [String]
}
