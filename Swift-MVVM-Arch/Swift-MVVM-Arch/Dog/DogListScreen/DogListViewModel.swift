//
//  DogListViewModel.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import Foundation
import Combine

@MainActor
class DogListViewModel: ObservableObject {
    @Published var dogBreeds: [String] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func loadDogBreeds() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await apiService.fetchDogBreeds()
            dogBreeds =  response.keys.sorted()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
