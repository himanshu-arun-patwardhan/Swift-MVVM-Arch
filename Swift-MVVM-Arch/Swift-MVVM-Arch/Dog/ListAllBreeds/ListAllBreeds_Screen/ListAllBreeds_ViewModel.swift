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
    @Published var allBreeds: [String] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let apiService: ListAllBreeds_APIService
    
    init(apiService: ListAllBreeds_APIService) {
        self.apiService = apiService
    }
    
    func loadDogBreeds() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await apiService.fetchAllBreeds()
            allBreeds =  response.keys.sorted()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
