//
//  ProductionCompany.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation

struct ProductionCompany: Codable {
    let name: String?
    let originCountry: String?
    let logoPath: String?
    let id: Int

    enum CodingKeys: String, CodingKey {
        case name
        case originCountry = "origin_country"
        case logoPath = "logo_path"
        case id
    }

    init(
        name: String? = "",
        originCountry: String? = "",
        logoPath: String? = "",
        id: Int = -1
    ) {
        self.name = name
        self.originCountry = originCountry
        self.logoPath = logoPath
        self.id = id
    }
}
