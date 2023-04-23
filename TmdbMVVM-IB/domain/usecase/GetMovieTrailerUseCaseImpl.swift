//
//  GetMovieTrailerUseCaseImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

struct GetMovieTrailerUseCaseImpl: GetMovieTrailerUseCase {

    let appRepository: AppRepository?

    init(appRepository: AppRepository?) {
        self.appRepository = appRepository
    }

    func call(movieId: Int) -> Observable<TrailerDomain> {
        if let appRepository = appRepository {
            return appRepository.fetchMovieTrailer(movieId: movieId)
        }

        return Observable.empty()
    }
}
