//
//  ErrorResponse.swift
//  data
//
//  Created by user on 30/04/24.
//

import Foundation

public struct ErrorResponse: Codable {
    public let success: Bool?
    public let statusCode: Int?
    public let statusMessage: String?

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }

    init(success: Bool?, statusCode: Int?, statusMessage: String?) {
        self.success = success
        self.statusCode = statusCode
        self.statusMessage = statusMessage
    }
}
