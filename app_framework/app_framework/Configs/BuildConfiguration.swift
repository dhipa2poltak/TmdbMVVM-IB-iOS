//
//  BuildConfiguration.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation

public enum Environment: String {
    case debugStaging = "Debug Staging"
    case releaseStaging = "Release Staging"

    case debugVerify = "Debug Verify"
    case releaseVerify = "Release Verify"

    case debugProduction = "Debug Production"
    case releaseProduction = "Release Production"
}

public class BuildConfiguration {
    public static let shared = BuildConfiguration()

    public var environment: Environment

    public var API_BASE_URL: String {
        switch environment {
        case .debugStaging, .releaseStaging:
            return "https://api.themoviedb.org/"
        case .debugVerify, .releaseVerify:
            return "https://api.themoviedb.org/"
        case .debugProduction, .releaseProduction:
            return "https://api.themoviedb.org/"
        }
    }

    public let API_KEY = "bf5c57d57d1c81706c6ef4794e8d753e"

    public init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String

        environment = Environment(rawValue: currentConfiguration)!
    }
}
