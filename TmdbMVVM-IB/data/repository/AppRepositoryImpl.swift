//
//  AppRepositoryImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

class AppRepositoryImpl: AppRepository {

    let appDataSource: AppDataSource?

    init(appDataSource: AppDataSource?) {
        self.appDataSource = appDataSource
    }

    func fetchMovieGenre() -> Observable<GenreDomain> {
        if let appDataSource = appDataSource {
            return appDataSource.fetchMovieGenre()
                .map { (response) -> GenreDomain in
                    response.toDomain()
                }
        }

        return Observable.empty()
    }

    func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreDomain> {
        if let appDataSource = appDataSource {
            return appDataSource.fetchMovieByGenre(genreId: genreId, page: page)
                .map { (response) -> DiscoverMovieByGenreDomain in
                    response.toDomain()
                }
        }

        return Observable.empty()
    }
    
    func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsDomain> {
        if let appDataSource = appDataSource {
            return appDataSource.fetchMovieDetail(movieId: movieId)
                .map { (response) -> MovieDetailsDomain in
                    response.toDomain()
                }
        }

        return Observable.empty()
    }

    func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewDomain> {
        if let appDataSource = appDataSource {
            return appDataSource.fetchMovieReviews(movieId: movieId, page: page)
                .map { (response) -> ReviewDomain in
                    response.toDomain()
                }
        }

        return Observable.empty()
    }

    func fetchMovieTrailer(movieId: Int) -> Observable<TrailerDomain> {
        if let appDataSource = appDataSource {
            return appDataSource.fetchMovieTrailer(movieId: movieId)
                .map { (response) -> TrailerDomain in
                    response.toDomain()
                }
        }

        return Observable.empty()
    }
}
