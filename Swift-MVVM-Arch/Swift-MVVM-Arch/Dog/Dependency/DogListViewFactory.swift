//
//  DogListViewFactory.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import Foundation

class DogListViewFactory {
    static func  buildView() -> DogListView {
        let apiService = APIService()
        let viewModel = DogListViewModel(apiService: apiService)
        return DogListView(viewModel: viewModel)
    }
}
