//
//  GetMovieByGenreUseCaseImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public struct GetMovieByGenreUseCaseImpl: GetMovieByGenreUseCase {

    let appRepository: AppRepository

    public init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    public func call(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreDomain> {
        return appRepository.fetchMovieByGenre(genreId: genreId, page: page)
    }
}
