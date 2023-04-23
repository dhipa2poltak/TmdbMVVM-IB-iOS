//
//  ReviewDomain.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

struct ReviewDomain {
    let results: [ReviewEntity]

    init(results: [ReviewEntity] = []) {
        self.results = results
    }
}
