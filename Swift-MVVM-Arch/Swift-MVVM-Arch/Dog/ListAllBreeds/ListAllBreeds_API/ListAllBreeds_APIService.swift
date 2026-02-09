//
//  ListAllBreeds_APIService.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import Foundation

final class ListAllBreeds_APIService: ListAllBreeds_APIServiceProtocol {
    let url = URL(string: "https://dog.ceo/api/breeds/list/all")!
    
    func fetchAllBreeds() async throws -> [String : [String]] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ListAllBreeds_APIResponseModel.self, from: data)
        return response.message
    }
}
