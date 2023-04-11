//
//  FetchData.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//
// Docs: https://www.exchangerate-api.com/docs/overview
//

import Foundation

private let apiKey = "903d367b4c9ec6fd8490919e"
private let baseURL = "https://v6.exchangerate-api.com/v6/"

enum CurrencyCode: String {
    case usd = "USD"
    case gbp = "GBP"
    case eur = "EUR"
}

struct FetchData {
    func latestCurrencyData(using session: URLSession = .shared, for currencyCode: CurrencyCode = CurrencyCode.gbp) async throws -> Currency {
        guard var url = URL(string: baseURL) else { throw FetchError.invalidURL }
        url.appendPathComponent(apiKey)
        url.appendPathComponent("latest/\(currencyCode)")

        let request = URLRequest(url: url)
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw FetchError.invalidServerResponse
        }

        do {
            let currency = try JSONDecoder().decode(Currency.self, from: data)
            return currency
        } catch {
            throw FetchError.invalidCurrencyDecoding
        }
    }
}
