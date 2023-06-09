import Combine

class CurrenciesViewModel {

    @Published var currency: Currency? = nil
    @Published var conversionRates: [ConversionRate] = []

    private var fetchData = FetchData()

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
