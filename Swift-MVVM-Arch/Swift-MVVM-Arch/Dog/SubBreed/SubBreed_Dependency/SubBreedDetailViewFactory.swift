//
//  SubBreedDetailViewFactory.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 09/02/26.
//

import Foundation

class SubBreedDetailViewFactory {
    static func build(breed: String, subBreed: String) -> SubBreedDetail_View {
        let apiService = SubBreed_APIService()
        let viewModel = SubBreedDetail_ViewModel(apiService: apiService)
        return SubBreedDetail_View(breed: breed, subBreed: subBreed, viewModel: viewModel)
    }
}
