//
//  ListResponse.swift
//  BeutiCustomer
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import Foundation

struct ListResponse<T: Codable>: Codable {
    let total_count: Int
    let items: [T]?
    enum CodingKeys: String, CodingKey {
        case items
        case total_count
    }
}
