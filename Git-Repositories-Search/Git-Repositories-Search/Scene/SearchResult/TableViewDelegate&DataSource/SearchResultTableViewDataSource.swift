//
//  SearchResultTableViewDataSource.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import UIKit

class SearchResultTableViewDataSource<CELL: UITableViewCell, T>: NSObject, UITableViewDataSource {
    
    // MARK: - properties:
    private var cellIdentifier: String!
    private var results: [SearchResultModel]!
    var configureCell: (CELL, SearchResultModel) -> Void = { _, _ in }
    
    init(cellIdentifier: String,
         results: [SearchResultModel],
         configureCell: @escaping (CELL, SearchResultModel) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.results = results
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CELL else {
            return UITableViewCell()
        }
        let repository = results[indexPath.row]
        self.configureCell(cell, repository)
        return cell
    }
}
