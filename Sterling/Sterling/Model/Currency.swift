//
//  Currency.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//

import Foundation

struct Currency: Decodable {
    let result: String
    let documentation: String
    let termsOfUse: String
    let timeLastUpdateUnix: TimeInterval
    let timeLastUpdateUTC: String
    let timeNextUpdateUnix: TimeInterval
    let timeNextUpdateUTC: String
    let baseCode: String
    let conversionRates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case result
        case documentation
        case termsOfUse = "terms_of_use"
        case timeLastUpdateUnix = "time_last_update_unix"
        case timeLastUpdateUTC = "time_last_update_utc"
        case timeNextUpdateUnix = "time_next_update_unix"
        case timeNextUpdateUTC = "time_next_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}
