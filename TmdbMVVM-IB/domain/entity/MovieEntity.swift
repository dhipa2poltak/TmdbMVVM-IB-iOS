//
//  MovieEntity.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

struct MovieEntity {
    let id: Int
    let title: String
    let overview: String
    let imageUrl: String

    init(id: Int = -1, title: String = "", overview: String = "", imageUrl: String = "") {
        self.id = id
        self.title = title
        self.overview = overview
        self.imageUrl = imageUrl
    }
}
