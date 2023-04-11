//
//  Currency.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//

import Foundation

struct Currency: Decodable, Hashable {
    let timeLastUpdateUTC: String
    let timeNextUpdateUTC: String
    let baseCode: String
    let conversionRates: ConversionRate

    enum CodingKeys: String, CodingKey {
        case timeLastUpdateUTC = "time_last_update_utc"
        case timeNextUpdateUTC = "time_next_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}

struct Item: Hashable {
    init(currency: Currency, lastUpdate: String = "", conversionRate: String = "", conversionRateCountryCode: String = "") {
        self.currency = currency
        self.lastUpdate = lastUpdate
        self.conversionRate = conversionRate
        self.conversionRateCountryCode = conversionRateCountryCode
    }

    var currency: Currency
    let lastUpdate: String
    let conversionRate: String
    let conversionRateCountryCode: String
}
