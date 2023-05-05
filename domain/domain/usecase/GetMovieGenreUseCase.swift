//
//  GetMovieGenreUseCase.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public protocol GetMovieGenreUseCase {
    func call() -> Observable<GenreDomain>
}
