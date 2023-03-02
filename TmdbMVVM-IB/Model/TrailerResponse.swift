//
//  TrailerResponse.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation

class TrailerResponse: Codable {
    let id: Int?
    let results: [Trailer]?

    enum CodingKeys: String, CodingKey {
        case id
        case results
    }

    init(
        id: Int?,
        results: [Trailer]?
    ) {
        self.id = id
        self.results = results
    }
}
