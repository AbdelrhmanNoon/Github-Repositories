//
//  SearchResultViewModel.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import Foundation
import PromiseKit
import Moya
import Combine

class SearchResultViewModel: NSObject {
    
    /*
     *  in this view model we can use RxSwift or combine.
     * i decided choose simple way as you can see closures. but also Combine simple more than closuers.
     */
    
    
    // MARK: - Properties
    private(set) var repositories: [SearchResultModel]! {
           didSet {
               self.bindItemsViewModelToController()
           }
       }
    var currentPage = 1
    var totalCount: Int = 0
    
    // MARK: - Bindings
    var bindItemsViewModelToController : (() -> Void) = {}
    var showLoader: (() -> Void)?
    var hideLoader: (() -> Void)?
    
    override init() {
        super.init()
        repositories = []
    }

    func getRepositoriesListFor(text: String) {
        self.showLoader?()
        NetworkManager.shared.getRepositoriesList(text: text,
                                                  page: currentPage) { (result) in
            self.hideLoader?()
            switch result {
            case .success(let list):
                self.totalCount = list.total_count
                self.repositories.append(contentsOf: list.items ?? [])
            case .failure(let error):
                // Should handleing Error: show error Alert
                print(error)
            }
        }
    }
    
    func getAllRepositories() {
        self.showLoader?()
        NetworkManager.shared.getAllRepositories { [weak self] result in
            guard let self = self else { return }
            self.repositories.append(contentsOf: result)
        }
        self.hideLoader?()
    }
        
    func willDisplayRepositories(with text: String) {
        getRepositoriesListFor(text: text)
    }
}

