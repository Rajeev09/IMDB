//
//  MovieListViewModel.swift
//  IMDB
//
//  Created by Rajeev on 25/06/22.
//

import Foundation

struct MovieModel: Decodable {
    var id: Int?
    var title: String?
    var overview: String?
    var popularity: Float?
    var rating: Float?
    var releaseDate: String?
    var posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, popularity
        case rating = "vote_average"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}

struct MovieListModel: Decodable {
    var totalResults: Int?
    var movies: [MovieModel]?
    var totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case movies = "results"
        case totalPages = "total_pages"
    }
    
}
