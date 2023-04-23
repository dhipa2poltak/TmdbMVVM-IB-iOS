//
//  GetMovieReviewUseCase.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

protocol GetMovieReviewUseCase {
    func call(movieId: Int, page: Int) -> Observable<ReviewDomain>
}
