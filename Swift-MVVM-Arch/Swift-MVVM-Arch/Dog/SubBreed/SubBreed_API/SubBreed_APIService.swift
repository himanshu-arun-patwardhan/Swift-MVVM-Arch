//
//  SubBreed_APIService.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 09/02/26.
//

import Foundation

final class SubBreed_APIService: SubBreed_APIServiceProtocol {
    func fetchRandomImages(breed:  String, subBreed: String) async throws -> [String] {
        let url = URL(string: "https://dog.ceo/api/breed/\(breed)/\(subBreed)/images/random/3")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let respose = try JSONDecoder().decode(SubBreed_APIResponseModel.self, from: data)
        return respose.message
    }
}
