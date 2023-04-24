//
//  GetMovieDetailsUseCaseImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

struct GetMovieDetailsUseCaseImpl: GetMovieDetailsUseCase {

    let appRepository: AppRepository

    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    func call(movieId: Int) -> Observable<MovieDetailsDomain> {
        return appRepository.fetchMovieDetail(movieId: movieId)
    }
}
