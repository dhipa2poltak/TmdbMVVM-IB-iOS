//
//  GetMovieDetailsUseCase.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

protocol GetMovieDetailsUseCase {
    func call(movieId: Int) -> Observable<MovieDetailsDomain>
}
