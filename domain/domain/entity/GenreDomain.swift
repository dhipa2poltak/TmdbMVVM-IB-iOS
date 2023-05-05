//
//  GenreDomain.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

public struct GenreDomain {
    public let genres: [GenreEntity]

    public init(genres: [GenreEntity] = []) {
        self.genres = genres
    }
}
