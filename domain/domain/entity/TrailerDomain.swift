//
//  TrailerDomain.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

public struct TrailerDomain {
    public let id: Int
    public let results: [TrailerEntity]

    public init(id: Int = -1, results: [TrailerEntity] = []) {
        self.id = id
        self.results = results
    }
}
