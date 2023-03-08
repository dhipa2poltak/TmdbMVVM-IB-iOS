//
//  AppCoordinator.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = GenreVC.instantiate()
        vc.viewModel = GenreVM()
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: false)
    }

    func showMovieByGenre(genreId: Int, genreName: String) {
        let vc = MovieByGenreVC.instantiate()
        let viewModel = MovieByGenreVM()
        viewModel.genreId = genreId
        viewModel.genreName = genreName
        vc.viewModel = viewModel
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieDetail(movieId: Int) {
        let vc = MovieDetailVC.instantiate()
        let viewModel = MovieDetailVM()
        viewModel.movieId = movieId
        vc.viewModel = viewModel
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieReview(movieId: Int, movieTitle: String) {
        let vc = MovieReviewVC.instantiate()
        let viewModel = MovieReviewVM()
        viewModel.movieId = movieId
        viewModel.movieTitle = movieTitle
        vc.viewModel = viewModel

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieTrailer(movieId: Int) {
        let vc = MovieTrailerVC.instantiate()
        let viewModel = MovieTrailerVM()
        viewModel.movieId = movieId
        vc.viewModel = viewModel

        navigationController.pushViewController(vc, animated: true)
    }
}
