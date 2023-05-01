//
//  AppError.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/05/23.
//

import Foundation

enum AppError: Error {
    case networkError(message: String)
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .networkError(message):
            return message
        }
    }
}
