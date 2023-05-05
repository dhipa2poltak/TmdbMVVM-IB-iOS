//
//  ReviewDomain.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

public struct ReviewDomain {
    public let results: [ReviewEntity]

    public init(results: [ReviewEntity] = []) {
        self.results = results
    }
}
