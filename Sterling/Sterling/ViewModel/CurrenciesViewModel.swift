//
//  CurrenciesViewModel.swift
//  Sterling
//
//  Created by Owen Henley on 28/03/2023.
//

import Combine

class CurrenciesViewModel {

    var currency: Currency?
    var conversionRates: [ConversionRate]

    private var fetchData = FetchData()

    init(currency: Currency? = nil, conversionRates: [ConversionRate] = []) {
        self.currency = currency
        self.conversionRates = conversionRates
    }

    func updateUI(_:() -> Void) {
        getCurrencyData()
    }

    private func getCurrencyData(for currency: CurrencyCode = CurrencyCode.gbp) {
        Task {
            do {
                let latestData = try await fetchData.latestCurrencyData(for: currency)
                self.currency = latestData
                print(self.currency!)
            } catch {
                print(FetchError.failed(error))
            }
        }
    }
}
