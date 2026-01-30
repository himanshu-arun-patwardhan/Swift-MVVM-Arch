//
//  APIServiceProtocol.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import Foundation


protocol APIServiceProtocol  {
    func fetchDogBreeds() async throws -> [String : [String]]
}
