//
//  AppDataSource.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public protocol AppDataSource {
    func fetchMovieGenre() -> Observable<GenreResponse>
    func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreResponse>
    func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsResponse>
    func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewResponse>
    func fetchMovieTrailer(movieId: Int) -> Observable<TrailerResponse>
}
