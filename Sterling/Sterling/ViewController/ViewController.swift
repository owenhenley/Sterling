//
//  ViewController.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//

import UIKit

class ViewController: UIViewController {

    private var fetchData = FetchData()

    override func viewDidLoad() {
        super.viewDidLoad()
        getExchangeRates()
    }

    func getExchangeRates() {
        Task {
            do {
                let currency = try await fetchData.exchangeRates()
                print(currency.result)
                print(currency.conversionRates)
            } catch {
                print(FetchError.failed(error))
            }
        }
    }
}
