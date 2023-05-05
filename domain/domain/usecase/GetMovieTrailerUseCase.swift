//
//  GetMovieTrailerUseCase.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public protocol GetMovieTrailerUseCase {
    func call(movieId: Int) -> Observable<TrailerDomain>
}
