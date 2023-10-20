//
//  NetworkManager.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import Foundation
import Moya

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    var provider = MoyaProvider<MultiTarget>()
    
    init() {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        provider = MoyaProvider<MultiTarget>(
            plugins: [NetworkLoggerPlugin(configuration: loggerConfig)])
    }
    
    func parseListResponse<T: Codable>(moyaResult: MoyaCompletion,
                                       completion: @escaping NetworkComplationForList<T> ) {
        switch moyaResult {
        case .success(let response):
            do {
                let json = try JSONDecoder().decode(ListResponse<T>.self, from: response.data)
                if (200...299 ~= response.statusCode) {
                    completion(.success(json))
                } else {
                 // Handling error when i have real Api
                }
            } catch {
                completion(.failure(ErrorHandler.serializationError))
            }
            
        case .failure:
            let customError = ErrorHandler.network
            completion(.failure(customError))
        }
    }
}
