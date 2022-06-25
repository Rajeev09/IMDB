//
//  PhotoViewModel.swift
//  Pexels
//
//  Created by Rajeev on 28/04/22.
//

import Foundation

struct MovieViewModel {
    
    let baseImagePath = "https://image.tmdb.org/t/p/w500"
    
    var id: Int
    var title: String
    var overview: String
    var popularity: Float
    var rating: Float
    var releaseDate: String
    var posterImageUrl: URL?
    
    init?(model: MovieModel) {
        guard let id = model.id,
              let title = model.title,
              let overview = model.overview,
              let popularity = model.popularity,
              let rating = model.rating,
              let releaseDate = model.releaseDate,
              let posterPath = model.posterPath
        else { return nil }
        self.id = id
        self.title = title
        self.overview = overview
        self.popularity = popularity
        self.rating = rating
        self.releaseDate = releaseDate
        self.posterImageUrl = URL(string: baseImagePath + posterPath)
    }
}
