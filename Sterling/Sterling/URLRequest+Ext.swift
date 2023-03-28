//
//  URLRequest+Ext.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//

import Foundation

extension URLRequest {
    enum HTTPMethod: String {
        case get = "GET"
        case head = "HEAD"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }

    var method: HTTPMethod? {
        get {
            guard let httpMethod = self.httpMethod else { return nil }
            let method = HTTPMethod(rawValue: httpMethod)
            return method
        }
        set {
            self.httpMethod = newValue?.rawValue
        }
    }

    init(url: URL, method: HTTPMethod, body: Data? = nil) {
        self.init(url: url)
        self.method = method
        self.httpBody = body
    }
}
