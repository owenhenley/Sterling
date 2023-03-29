import Foundation

let baseURL = "https://v6.exchangerate-api.com/v6/"
let apiKey = "903d367b4c9ec6fd8490919e"
let currency = "GBP"

enum FetchError: Error {
    case invalidURL
    case invalidCurrency
    case invalidServerResponse
    case failed(Error)
}

struct Fetch {
    func exchangeRates(using session: URLSession = .shared) async throws -> [Currency] {
        guard var url = URL(string: baseURL) else { throw FetchError.invalidURL }
        url.appendPathComponent(apiKey)
        url.appendPathComponent(currency)

        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw FetchError.invalidServerResponse }

        do {
            let currencies = try JSONDecoder().decode([Currency].self, from: data)
            return currencies
        } catch {
            throw FetchError.invalidCurrency
        }
    }
}

class Call {

    let fetch = Fetch()

    func getExchangeRates() async {
        do {
            let currencies = try await fetch.exchangeRates()
            print(currencies)
        } catch {
            print(error)
        }
    }
}
