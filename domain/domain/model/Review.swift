//
//  ReviewEntity.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

public struct Review {
    public let author: String
    public let authorDetails: AuthorDetails?
    public let content: String

    public init(author: String = "", authorDetails: AuthorDetails? = nil, content: String = "") {
        self.author = author
        self.authorDetails = authorDetails
        self.content = content
    }
}
