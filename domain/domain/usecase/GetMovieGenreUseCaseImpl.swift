//
//  GetMovieGenreUseCaseImpl.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public struct GetMovieGenreUseCaseImpl: GetMovieGenreUseCase {

    let appRepository: AppRepository

    public init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    public func call() -> Observable<GenreModel> {
        return appRepository.fetchMovieGenre()
    }
}
