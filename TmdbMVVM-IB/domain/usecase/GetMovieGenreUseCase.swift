//
//  GetMovieGenreUseCase.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

protocol GetMovieGenreUseCase {
    func call() -> Observable<GenreDomain>
}
