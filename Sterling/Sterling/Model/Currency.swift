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
    let conversionRates: [ConversionRate]

    enum CodingKeys: String, CodingKey {
        case timeLastUpdateUTC = "time_last_update_utc"
        case timeNextUpdateUTC = "time_next_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}

struct ConversionRate: Decodable, Hashable {
    var currencyCode: String
    var conversionRate: Double
}

#if DEBUG
extension Currency {
    static var sampleData = [
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: [ConversionRate(currencyCode: "GBP", conversionRate: 1.0)]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: [ConversionRate(currencyCode: "USD", conversionRate: 0.9)]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: [ConversionRate(currencyCode: "ABC", conversionRate: 1.1)]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: [ConversionRate(currencyCode: "XYZ", conversionRate: 1.6)]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: [ConversionRate(currencyCode: "N/A", conversionRate: 1.5)]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: [ConversionRate(currencyCode: "RPE", conversionRate: 3.2)]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: [ConversionRate(currencyCode: "YEN", conversionRate: 1.8)]),
        Currency(timeLastUpdateUTC: "", timeNextUpdateUTC: "", baseCode: "GBP", conversionRates: [ConversionRate(currencyCode: "CHZ", conversionRate: 2.7)])
    ]
}
#endif

struct Item: Hashable {

    private var currency: Currency
    let lastUpdate: String
    let conversionRate: String
    let conversionRateCountryCode: String
    private let identifier = UUID()

    init(currency: Currency, lastUpdate: String = "", conversionRate: String = "", conversionRateCountryCode: String = "") {
        self.currency = currency
        self.lastUpdate = currency.timeLastUpdateUTC
        self.conversionRate = currency.conversionRates.values.description
        self.conversionRateCountryCode = currency.conversionRates.keys.formatted()
    }
}
