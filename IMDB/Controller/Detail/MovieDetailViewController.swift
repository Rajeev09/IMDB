//
//  MovieDetailViewController.swift
//  IMDB
//
//  Created by Rajeev on 25/06/22.
//

import UIKit

class MovieDetailViewController: UIViewController {

    private var viewModel: MovieViewModel?

    
    @IBOutlet weak private var movieImageView: UIImageView!
    @IBOutlet weak private var releaseLabel: UILabel!
    @IBOutlet weak private var ratingLabel: UILabel!
    @IBOutlet weak private var popularityLabel: UILabel!
    @IBOutlet weak private var overViewLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.title
        setUpContent()
    }
    
    func setUpViewModel(viewModel: MovieViewModel?) {
        self.viewModel = viewModel
    }
    
    func setUpContent() {
        guard let viewModel = viewModel else { return }
        if let posterImageUrl = viewModel.posterImageUrl {
            movieImageView.sd_setImage(with: posterImageUrl, placeholderImage: nil)
        }
        releaseLabel.text = viewModel.releaseDate
        ratingLabel.text = String(viewModel.rating)
        popularityLabel.text = String(viewModel.popularity)
        overViewLabel.text = viewModel.overview
    }

}
