//
//  AppRepository.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public protocol AppRepository {
    func fetchMovieGenre() -> Observable<GenreDomain>
    func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreDomain>
    func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsDomain>
    func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewDomain>
    func fetchMovieTrailer(movieId: Int) -> Observable<TrailerDomain>
}
