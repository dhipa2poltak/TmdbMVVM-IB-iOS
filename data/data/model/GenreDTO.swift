//
//  Genre.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation

struct GenreDTO: Codable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
