//
//  Currency.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//

import Foundation

struct Currency: Codable {
    let result: String
    let documentation: String
    let terms: String
    let lastUpdateUnix: Double
    let lastUpdateUTC: String
    let nextUpdateUnix: Double
    let nextUpdateUTC: String
    let baseCode: String
    let conversionRates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case result
        case documentation
        case terms = "terms_of_use"
        case lastUpdateUnix = "time_last_update_unix"
        case lastUpdateUTC = "time_last_update_utc"
        case nextUpdateUnix = "time_next_update_unix"
        case nextUpdateUTC = "time_next_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}
