//
//  AppDataSourceImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

class RemoteDataSourceImpl: AppDataSource {

    let apiClient: ApiClient?

    init(apiClient: ApiClient?) {
        self.apiClient = apiClient
    }

    func fetchMovieGenre() -> Observable<GenreResponse> {
        if let apiClient = apiClient {
            return apiClient.fetchMovieGenre()
        }

        return Observable.empty()
    }

    func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreResponse> {
        if let apiClient = apiClient {
            return apiClient.fetchMovieByGenre(genreId: genreId, page: page)
        }

        return Observable.empty()
    }

    func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsResponse> {
        if let apiClient = apiClient {
            return apiClient.fetchMovieDetail(movieId: movieId)
        }

        return Observable.empty()
    }

    func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewResponse> {
        if let apiClient = apiClient {
            return apiClient.fetchMovieReviews(movieId: movieId, page: page)
        }

        return Observable.empty()
    }

    func fetchMovieTrailer(movieId: Int) -> Observable<TrailerResponse> {
        if let apiClient = apiClient {
            return apiClient.fetchMovieTrailer(movieId: movieId)
        }

        return Observable.empty()
    }
}
