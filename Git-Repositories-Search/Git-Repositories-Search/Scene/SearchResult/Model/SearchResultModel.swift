//
//  SearchResultModel.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import Foundation

struct SearchResultModel: Codable {
    let owner: Owner
    let name: String
    let description: String?
    let stargazers_count: Int?
    let language: String?
}

struct Owner: Codable {
    let avatar_url: String
    let login: String
}
