//
//  GetMovieGenreUseCaseImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

struct GetMovieGenreUseCaseImpl: GetMovieGenreUseCase {

    let appRepository: AppRepository

    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    func call() -> Observable<GenreDomain> {
        return appRepository.fetchMovieGenre()
    }
}
