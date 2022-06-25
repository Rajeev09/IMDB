//
//  MovieListViewController.swift
//  IMDB
//
//  Created by Rajeev on 25/06/22.
//

import UIKit

class MovieListViewController: UIViewController {
        
    private var activityIndicator: UIActivityIndicatorView!
    
    lazy var viewModel: MovieListViewModel = {
        return MovieListViewModel(movieListUseCase: MovieListUseCase(networkManager: NetworkManager.shared))
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.setupBinding()
        self.setupTableView()
        self.viewModel.getMovies()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true

        tableView.registerCell(MovieTableViewCell.self)
        
    }
    
    private func setupBinding() {
        viewModel.viewState.bind = { [weak self] state in
            guard let self = self else { return }
            self.render(state: state)
        }
    }
}

extension MovieListViewController {
    private func render(state: ViewState) {
        switch state {
        case .Loading:
//            activityIndicator.startAnimating()
            self.tableView.isHidden = true
        case .Loaded:
//            activityIndicator.stopAnimating()
            self.tableView.isHidden = false
            self.tableView.reloadData()
        case .Error:
            self.tableView.isHidden = false
//            activityIndicator.stopAnimating()
        }
    }
    
    func showMovieDetailController(viewModel: MovieViewModel) {
        let controller = MovieDetailViewController(nibName: nil, bundle: nil)
        controller.setUpViewModel(viewModel: viewModel)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
