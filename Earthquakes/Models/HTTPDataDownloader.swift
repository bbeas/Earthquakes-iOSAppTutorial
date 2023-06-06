//
//  HTTPDataDownloader.swift
//  Earthquakes-iOS
//
//  Created by Shen Beibei on 06/06/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

let validStatus = 200 ... 299

// defining this protocol abstracts the network transport from the rest of the client code
protocol HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data
}

// simplifies the call to URLSession by throwing a network error
extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse),
              validStatus.contains(response.statusCode)
        else {
            throw QuakeError.networkError
        }
        return data
    }
}
