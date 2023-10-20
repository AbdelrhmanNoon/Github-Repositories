//
//  ViewController.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import UIKit

class MasterViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
       setupViews()
    }
    
    private func setupViews() {
        searchBar.showsCancelButton = true
        searchBar.delegate = self
    
    }
}

// MARK: - Actions
extension MasterViewController {
    @IBAction func showAllReposButtonTapped(_ sender: UIButton) {
        let vc = SearchResultViewController(searchText: searchBar.text ?? "", isThatSearch: false)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - UISearchBarDelegate
extension MasterViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let vc = SearchResultViewController(searchText: searchBar.text ?? "", isThatSearch: true)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
