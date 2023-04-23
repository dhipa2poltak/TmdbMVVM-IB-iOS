//
//  DiscoverMovieByGenreResponse.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation

struct DiscoverMovieByGenreResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    init(
        page: Int = -1,
        results: [Movie] = [],
        totalPages: Int = -1,
        totalResults: Int = -1
    ) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

extension DiscoverMovieByGenreResponse {
    func toDomain() -> DiscoverMovieByGenreDomain {
        let movieEntities = results.map { (movie) -> MovieEntity in
            return MovieEntity(
                id: movie.id,
                title: movie.title,
                overview: movie.overview,
                imageUrl: ""
            )
        }

        return DiscoverMovieByGenreDomain(
            page: self.page,
            results: movieEntities,
            totalPages: self.totalPages,
            totalResults: self.totalResults
        )
    }
}
