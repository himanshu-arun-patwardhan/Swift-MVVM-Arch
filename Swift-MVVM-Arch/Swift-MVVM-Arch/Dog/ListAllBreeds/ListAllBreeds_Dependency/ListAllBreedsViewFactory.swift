//
//  ListAllBreedsViewFactory.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import Foundation

class ListAllBreedsViewFactory {
    static func  buildView() -> ListAllBreeds_View {
        let apiService = ListAllBreeds_APIService()
        let viewModel = ListAllBreeds_ViewModel(apiService: apiService)
        return ListAllBreeds_View(viewModel: viewModel)
    }
}
