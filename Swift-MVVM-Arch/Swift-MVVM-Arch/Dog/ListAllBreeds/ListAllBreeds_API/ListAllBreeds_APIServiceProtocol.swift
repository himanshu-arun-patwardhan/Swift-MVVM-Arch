//
//  ListAllBreeds_APIServiceProtocol.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import Foundation


protocol ListAllBreeds_APIServiceProtocol  {
    func fetchAllBreeds() async throws -> [String : [String]]
}
