//
//  AuthorDetailsEntity.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

public struct AuthorDetailsEntity {
    public let avatarPath: String

    public init(avatarPath: String = "") {
        self.avatarPath = avatarPath
    }
}
