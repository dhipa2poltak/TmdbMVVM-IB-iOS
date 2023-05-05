//
//  GetMovieDetailsUseCaseImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public struct GetMovieDetailsUseCaseImpl: GetMovieDetailsUseCase {

    let appRepository: AppRepository

    public init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    public func call(movieId: Int) -> Observable<MovieDetailsDomain> {
        return appRepository.fetchMovieDetail(movieId: movieId)
    }
}
