//
//  AppCoordinator.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Swinject
import UIKit

class AppCoordinator: Coordinator {
    private let container = Container()

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        registerDependencies()
    }

    private func registerDependencies() {
        self.container.register(AppCoordinator.self) { _ in
            self
        }.inObjectScope(.container)

        self.container.register(ApiClient.self) { _ in
            ApiClient()
        }.inObjectScope(.container)

        self.container.register(GenreVM.self) { [weak self] _ in
            GenreVM(apiClient: self?.container.resolve(ApiClient.self))
        }

        self.container.register(MovieByGenreVM.self) { [weak self] _ in
            MovieByGenreVM(apiClient: self?.container.resolve(ApiClient.self))
        }

        self.container.register(MovieDetailVM.self) { [weak self] _ in
            MovieDetailVM(apiClient: self?.container.resolve(ApiClient.self))
        }

        self.container.register(MovieReviewVM.self) { [weak self] _ in
            MovieReviewVM(apiClient: self?.container.resolve(ApiClient.self))
        }

        self.container.register(MovieTrailerVM.self) { [weak self] _ in
            MovieTrailerVM(apiClient: self?.container.resolve(ApiClient.self))
        }
    }

    func start() {
        let vc = GenreVC.instantiate()
        vc.viewModel = container.resolve(GenreVM.self)
        vc.coordinator = container.resolve(AppCoordinator.self)

        navigationController.pushViewController(vc, animated: false)
    }

    func showMovieByGenre(genreId: Int, genreName: String) {
        let vc = MovieByGenreVC.instantiate()
        let viewModel = container.resolve(MovieByGenreVM.self)
        viewModel?.genreId = genreId
        viewModel?.genreName = genreName
        vc.viewModel = viewModel
        vc.coordinator = container.resolve(AppCoordinator.self)

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieDetail(movieId: Int) {
        let vc = MovieDetailVC.instantiate()
        let viewModel = container.resolve(MovieDetailVM.self)
        viewModel?.movieId = movieId
        vc.viewModel = viewModel
        vc.coordinator = container.resolve(AppCoordinator.self)

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieReview(movieId: Int, movieTitle: String) {
        let vc = MovieReviewVC.instantiate()
        let viewModel = container.resolve(MovieReviewVM.self)
        viewModel?.movieId = movieId
        viewModel?.movieTitle = movieTitle
        vc.viewModel = viewModel

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieTrailer(movieId: Int) {
        let vc = MovieTrailerVC.instantiate()
        let viewModel = container.resolve(MovieTrailerVM.self)
        viewModel?.movieId = movieId
        vc.viewModel = viewModel

        navigationController.pushViewController(vc, animated: true)
    }
}
