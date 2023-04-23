//
//  AuthorDetailsEntity.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import Foundation

struct AuthorDetailsEntity {
    let avatarPath: String

    init(avatarPath: String = "") {
        self.avatarPath = avatarPath
    }
}
