//
//  TrailerEntity.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

class TrailerEntity {
    let id: String
    let key: String
    let name: String
    let site: String

    init(id: String = "", key: String = "", name: String = "", site: String = "") {
        self.id = id
        self.key = key
        self.name = name
        self.site = site
    }
}
