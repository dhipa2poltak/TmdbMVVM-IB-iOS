//
//  AppRepository.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public protocol AppRepository {
    func fetchMovieGenre() -> Observable<GenreModel>
    func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreModel>
    func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsModel>
    func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewModel>
    func fetchMovieTrailer(movieId: Int) -> Observable<TrailerModel>
}
