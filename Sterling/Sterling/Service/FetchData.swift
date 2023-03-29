//
//  FetchData.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//

import Foundation

private let apiKey = "903d367b4c9ec6fd8490919e"

struct FetchData {

    private let baseURL = "https://v6.exchangerate-api.com/v6/"
    private let currency = "USD"

    func exchangeRates(using session: URLSession = .shared) async throws -> Currency {
        guard var url = URL(string: baseURL) else { throw FetchError.invalidURL }
        url.appendPathComponent(apiKey)
        url.appendPathComponent("latest/\(currency)")
        let request = URLRequest(url: url, method: .get)
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw FetchError.invalidServerResponse }
        print("Valid response")

        do {
            let currency = try JSONDecoder().decode(Currency.self, from: data)
            return currency
        } catch {
            throw FetchError.invalidCurrency
        }
    }
}
