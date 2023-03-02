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
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: false)
    }

    func showMovieByGenre(genreId: Int, genreName: String) {
        let vc = MovieByGenreVC.instantiate()
        vc.viewModel.genreId = genreId
        vc.viewModel.genreName = genreName
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieDetail(movieId: Int) {
        let vc = MovieDetailVC.instantiate()
        vc.viewModel.movieId = movieId
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieReview(movieId: Int, movieTitle: String) {
        let vc = MovieReviewVC.instantiate()
        vc.viewModel.movieId = movieId
        vc.viewModel.movieTitle = movieTitle

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieTrailer(movieId: Int) {
        let vc = MovieTrailerVC.instantiate()
        vc.viewModel.movieId = movieId

        navigationController.pushViewController(vc, animated: true)
    }
}
