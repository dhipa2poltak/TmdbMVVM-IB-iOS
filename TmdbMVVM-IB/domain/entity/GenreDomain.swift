//
//  GenreDomain.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

struct GenreDomain {
    let genres: [GenreEntity]

    init(genres: [GenreEntity] = []) {
        self.genres = genres
    }
}
