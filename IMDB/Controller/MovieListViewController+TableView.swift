//
//  MovieListViewController+TableView.swift
//  IMDB
//
//  Created by Rajeev on 25/06/22.
//

import UIKit

extension MovieListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCellModelsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(MovieTableViewCell.self, indexPath: indexPath)
        cell.selectionStyle = .none
        cell.configure(viewModel: viewModel.getCellModel(at: indexPath.row))
        return cell
    }
}

extension MovieListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = viewModel.getCellModel(at: indexPath.row)
        self.showMovieDetailController(viewModel: cellModel)
    }

}
