//
//  ReviewEntity.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

struct ReviewEntity {
    let author: String
    let authorDetails: AuthorDetailsEntity?
    let content: String

    init(author: String = "", authorDetails: AuthorDetailsEntity? = nil, content: String = "") {
        self.author = author
        self.authorDetails = authorDetails
        self.content = content
    }
}
