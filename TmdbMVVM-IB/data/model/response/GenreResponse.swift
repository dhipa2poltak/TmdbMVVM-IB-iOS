//
//  GenreResponse.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation

struct GenreResponse: Codable {
    let genres: [Genre]?

    enum CodingKeys: String, CodingKey {
        case genres
    }

    init(genres: [Genre]?) {
        self.genres = genres
    }
}

extension GenreResponse {
    func toDomain() -> GenreDomain {
        let genreEntities = genres?.map { (genre) -> GenreEntity in
            return GenreEntity(id: genre.id ?? -1, name: genre.name ?? "")
        }

        return GenreDomain(genres: genreEntities ?? [])
    }
}
