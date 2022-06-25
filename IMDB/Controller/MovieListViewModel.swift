//
//  MovieListViewModel.swift
//  IMDB
//
//  Created by Rajeev on 25/06/22.
//

import Foundation

class MovieListViewModel {
    
    private let movieListUseCase: MovieUseCaseProtocol
    
    var cellModels = [MovieViewModel]()
    
    let viewState: Observable<ViewState> = Observable(.Loading)

    
    
    init(movieListUseCase: MovieUseCaseProtocol) {
        self.movieListUseCase = movieListUseCase
    }

    func getMovies(page: Int? = 1) {
        self.viewState.value = .Loading
        self.movieListUseCase.fetchMovies(page: page) { [weak self] result in
            guard let self = self else { return }
            self.viewState.value = .Loaded
            switch result {
            case .success(let modelList):
                self.cellModels = modelList.movies?.compactMap { MovieViewModel(model: $0) } ?? []
                self.viewState.value = .Loaded
            case .failure(let error):
                self.viewState.value = .Error(error)
            }
        }
    }
    
}


extension MovieListViewModel {
    func getCellModelsCount() -> Int {
        return cellModels.count
    }
    
    func getCellModel(at index: Int) -> MovieViewModel {
        return cellModels[index]
    }
}
