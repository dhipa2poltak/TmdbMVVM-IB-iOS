//
//  GenreResponse.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation

class GenreResponse: Codable {
    let genres: [Genre]?

    enum CodingKeys: String, CodingKey {
        case genres
    }

    init(genres: [Genre]?) {
        self.genres = genres
    }
}
