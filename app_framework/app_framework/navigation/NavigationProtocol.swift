//
//  NavigationProtocol.swift
//  app_framework
//
//  Created by user on 06/05/23.
//

import Foundation

public protocol NavigationProtocol {

    func showMovieByGenre(genreId: Int, genreName: String)

    func showMovieDetail(movieId: Int)

    func showMovieReview(movieId: Int, movieTitle: String)

    func showMovieTrailer(movieId: Int)
}

