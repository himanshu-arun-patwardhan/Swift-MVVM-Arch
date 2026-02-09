//
//  SubBreedDetail_View.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 08/02/26.
//

import SwiftUI

struct SubBreedDetail_View: View {
    let breed: String
    let subBreed: String
    let viewModel: SubBreedDetail_ViewModel
    
    var body: some View {
        Text(subBreed)
            .navigationTitle(breed)
    }
}
