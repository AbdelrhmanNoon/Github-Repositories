//
//  SearchApiCalls.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import Foundation
import Moya
import RxSwift

extension NetworkManager {
    
    // Api Call Using Moya
    func getRepositoriesList(text: String,
                             page: Int,
                             completion: @escaping (
                            _ result: Swift.Result<ListResponse<SearchResultModel>, Error>) -> Void) {
        
        self.provider.request(MultiTarget(SearchApis.getSearchResultsFor(searchText: text, andPageNumber: page))) { (result) in
            self.parseListResponse(moyaResult: result, completion: completion)
        }
    }
    
    // Api Call Using URL Session
    func getAllRepositories(completion: @escaping ([SearchResultModel]) -> Void) {
        let url = URL(string: "https://api.github.com/repositories")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching repositories: \(error)")
            return
          }
          
            // Handling Error as you need
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(response)")
            return
          }
            
          if let data = data,
            let allrepositories = try? JSONDecoder().decode([SearchResultModel].self, from: data) {
              completion(allrepositories)
          }
        })
        task.resume()
      }
}
