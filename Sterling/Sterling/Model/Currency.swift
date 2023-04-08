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
    let conversionRates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case timeLastUpdateUTC = "time_last_update_utc"
        case timeNextUpdateUTC = "time_next_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}

#if DEBUG
extension Currency {
    static var sampleData = [
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: ["GBP": 1.0]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: ["USD": 0.9]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: ["ABC": 1.1]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: ["XYZ": 1.6]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: ["N/A": 1.5]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: ["RPE": 3.2]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: ["YEN": 1.8]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: ["CHZ": 2.7])
    ]
}
#endif

struct Item: Hashable {
    let currency: Currency
    private let identifier = UUID()

    internal init(currency: Currency) {
        self.currency = currency
    }
}
