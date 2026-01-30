//
//  APIService.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import Foundation

final class APIService: APIServiceProtocol {
    let url = URL(string: "https://dog.ceo/api/breeds/list/all")!
    
    func fetchDogBreeds() async throws -> [String : [String]] {
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(APIResponseModel.self, from: data)
        return response.message
    }
}
