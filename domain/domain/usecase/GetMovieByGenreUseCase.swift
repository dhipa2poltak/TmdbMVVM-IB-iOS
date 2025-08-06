//
//  GetMovieByGenreUseCase.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation
import RxSwift

public protocol GetMovieByGenreUseCase {
    func call(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreModel>
}
