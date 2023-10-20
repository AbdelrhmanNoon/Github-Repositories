//
//  typealiases.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import Foundation
import Moya

typealias MoyaCompletion = (Result<Moya.Response, MoyaError>)
typealias NetworkComplationForList<T: Codable> = (
    _ result: Swift.Result<ListResponse<T>, Error>) -> Void
