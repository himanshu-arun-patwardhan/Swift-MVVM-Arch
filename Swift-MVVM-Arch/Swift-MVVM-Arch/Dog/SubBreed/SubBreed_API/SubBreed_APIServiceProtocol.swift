//
//  SubBreed_APIServiceProtocol.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 09/02/26.
//

import Foundation

protocol SubBreed_APIServiceProtocol {
    func fetchRandomImages(breed:  String, subBreed: String) async throws -> [String]
}
