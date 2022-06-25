//
//  SearchUseCase.swift
//  Pexels
//
//  Created by Rajeev on 28/04/22.
//

import Foundation


protocol MovieUseCaseProtocol {
    func fetchMovies(page: Int?, completion: @escaping (Result<MovieListModel, Error>) -> ())
}

struct MovieListUseCase: MovieUseCaseProtocol {
    
    private let baseUrl = "https://api.themoviedb.org/3"
    private let moviesEndPoint = "/movie/popular"
    
    let networkManager: DataSourceProtocol
    
    init(networkManager: DataSourceProtocol) {
        self.networkManager = networkManager
    }
    
    func getBaseUrl(page: Int?) -> String {
        var url = baseUrl + moviesEndPoint + "?api_key=38a73d59546aa378980a88b645f487fc"
        if let page = page {
            url += "&page=\(page)"
        }
        return url
    }
    
    func fetchMovies(page: Int?, completion: @escaping (Result<MovieListModel, Error>) -> ()) {
        let baseUrl = getBaseUrl(page: page)
        self.networkManager.fetchData(from: baseUrl) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    
}
