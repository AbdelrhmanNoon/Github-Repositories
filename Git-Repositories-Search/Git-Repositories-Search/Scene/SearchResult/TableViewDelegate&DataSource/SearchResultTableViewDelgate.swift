//
//  SearchResultTableViewDelgate.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 7/18/21.
//

import UIKit

class SearchResultTableViewDelgate<CELL: UITableViewCell, T>: NSObject, UITableViewDelegate {
    
    // MARK: - properties:
    private var repositories: [SearchResultModel]!
    private var repositoriesViewModel: SearchResultViewModel!
    private var searchText: String = ""
    
    init(repositories: [SearchResultModel],
         repositoriesViewModel: SearchResultViewModel,
         searchText: String) {
        self.repositories = repositories
        self.repositoriesViewModel = repositoriesViewModel
        self.searchText = searchText
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == repositories.count &&
            repositories.count < repositoriesViewModel.totalCount
            {
            repositoriesViewModel.currentPage += 1
            repositoriesViewModel.willDisplayRepositories(with: searchText)
        }
    }
}
