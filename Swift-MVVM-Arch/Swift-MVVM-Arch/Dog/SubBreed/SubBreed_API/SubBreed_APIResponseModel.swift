//
//  SubBreed_APIResponseModel.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 09/02/26.
//

import Foundation

struct SubBreed_APIResponseModel: Decodable {
    let message: [String]
    let status: String
}
