//
//  SubBreedDetail_ViewModel.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 09/02/26.
//

import Foundation
import Combine

@MainActor
class SubBreedDetail_ViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var imageURLs: [URL] = []
    
    private let apiService: SubBreed_APIService
    
    init(apiService: SubBreed_APIService) {
        self.apiService  = apiService
    }
    
    func loadImage(breed: String, subBreed: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await apiService.fetchRandomImages(breed: breed.lowercased(), subBreed: subBreed.lowercased())
            imageURLs = makeStructuredData(imageUrls: response)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    private func makeStructuredData(imageUrls: [String]) -> [URL] {
        imageUrls.compactMap(URL.init)
    }
}
