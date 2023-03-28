import Foundation

let baseURL = "https://v6.exchangerate-api.com/v6/"
let apiKey = "903d367b4c9ec6fd8490919e"
let currency = "GBP"

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }

func fetchExchangeRates() async throws -> [Currency] {
    guard var url = URL(string: baseURL) else { return }
    url.appendPathComponent(apiKey)
    url.appendPathComponent(currency)

    let request = URLRequest(url: url, method: .get)

    URLSession.dataTask(with: request) { (data, response, error) in
        if let error {
            print("Error: \(#file), \(#function), \(#line), Message: \(error). \(error.localizedDescription)")
            completion(nil, error)
            return
        }

        guard let data else {
            completion(nil, nil)
            print("Error: Data is invalid", #file, #function, #line)
            return
        }

        let jsonDecoder = JSONDecoder()
        do {
            let conversionRates = try jsonDecoder.decode([Currency().conversionRates].self, from: data)
            completion(conversionRates, nil)
        } catch {
            print("Error: \(#file), \(#function), \(#line), Message: \(error). \(error.localizedDescription)")
        }

    }.resume()
}

fetchExchangeRates()
