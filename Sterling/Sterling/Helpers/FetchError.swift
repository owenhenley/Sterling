//
//  FetchError.swift
//  Sterling
//
//  Created by Owen Henley on 28/03/2023.
//

import Foundation

enum FetchError: Error {
    case invalidURL
    case invalidCurrency
    case invalidServerResponse
    case failed(Error)
}
