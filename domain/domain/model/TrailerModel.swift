//
//  TrailerDomain.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

public struct TrailerModel {
    public let id: Int
    public let results: [Trailer]

    public init(id: Int = -1, results: [Trailer] = []) {
        self.id = id
        self.results = results
    }
}
