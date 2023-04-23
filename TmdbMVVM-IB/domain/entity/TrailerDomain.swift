//
//  TrailerDomain.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

struct TrailerDomain {
    let id: Int
    let results: [TrailerEntity]

    init(id: Int = -1, results: [TrailerEntity] = []) {
        self.id = id
        self.results = results
    }
}
