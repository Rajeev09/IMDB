//
//  MovieTableViewCell.swift
//  IMDB
//
//  Created by Rajeev on 25/06/22.
//

import UIKit
import SDWebImage


class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak private var movieImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: MovieViewModel) {
        if let posterImageUrl = viewModel.posterImageUrl {
            movieImageView.sd_setImage(with: posterImageUrl, placeholderImage: nil)
        }
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.overview
    }
    
}
