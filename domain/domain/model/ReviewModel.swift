//
//  ReviewDomain.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

public struct ReviewModel {
    public let results: [Review]

    public init(results: [Review] = []) {
        self.results = results
    }
}
