//
//  GetMovieReviewUseCaseImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

struct GetMovieReviewUseCaseImpl: GetMovieReviewUseCase {

    let appRepository: AppRepository

    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    func call(movieId: Int, page: Int) -> Observable<ReviewDomain> {
        return appRepository.fetchMovieReviews(movieId: movieId, page: page)
    }
}
