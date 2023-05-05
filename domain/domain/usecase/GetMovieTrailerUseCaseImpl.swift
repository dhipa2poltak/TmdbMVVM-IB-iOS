//
//  GetMovieTrailerUseCaseImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public struct GetMovieTrailerUseCaseImpl: GetMovieTrailerUseCase {

    let appRepository: AppRepository

    public init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    public func call(movieId: Int) -> Observable<TrailerDomain> {
        return appRepository.fetchMovieTrailer(movieId: movieId)
    }
}
