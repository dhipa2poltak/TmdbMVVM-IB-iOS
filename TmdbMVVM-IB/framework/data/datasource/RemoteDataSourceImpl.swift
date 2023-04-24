//
//  AppDataSourceImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

class RemoteDataSourceImpl: AppDataSource {

    let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func fetchMovieGenre() -> Observable<GenreResponse> {
        return apiClient.fetchMovieGenre()
    }

    func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreResponse> {
        return apiClient.fetchMovieByGenre(genreId: genreId, page: page)
    }

    func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsResponse> {
        return apiClient.fetchMovieDetail(movieId: movieId)
    }

    func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewResponse> {
        return apiClient.fetchMovieReviews(movieId: movieId, page: page)
    }

    func fetchMovieTrailer(movieId: Int) -> Observable<TrailerResponse> {
        return apiClient.fetchMovieTrailer(movieId: movieId)
    }
}
