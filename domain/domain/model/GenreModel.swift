//
//  GenreDomain.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

public struct GenreModel {
    public let genres: [Genre]

    public init(genres: [Genre] = []) {
        self.genres = genres
    }
}
