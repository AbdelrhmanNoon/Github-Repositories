//
//  SearchResultTableViewCell.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import UIKit
import Kingfisher

class SearchResultTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var itemNameLabel: UILabel!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    @IBOutlet private weak var starsCountLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: - Cell Confguration
extension SearchResultTableViewCell {
    func configure(with repo: SearchResultModel) {
        let url = URL(string: repo.owner.avatar_url)
        self.userImageView.kf.setImage(with: url)
        self.userNameLabel.text = repo.owner.login
        self.itemNameLabel.text = repo.name
        self.itemDescriptionLabel.text = repo.description
        self.starsCountLabel.text = "\(repo.stargazers_count ?? 0)"
        self.languageLabel.text = repo.language
    }
    
}
