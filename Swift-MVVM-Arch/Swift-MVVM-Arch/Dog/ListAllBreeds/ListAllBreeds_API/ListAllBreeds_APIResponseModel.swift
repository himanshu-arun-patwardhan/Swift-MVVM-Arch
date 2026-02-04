//
//  ListAllBreeds_APIResponseModel.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import Foundation

struct ListAllBreeds_APIResponseModel: Decodable {
    let message: [String: [String]]
    let status: String
}
