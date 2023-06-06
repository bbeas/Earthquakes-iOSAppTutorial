//
//  TestDownloader.swift
//  Earthquakes-iOS
//
//  Created by Shen Beibei on 06/06/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000 ... 500_000_000))
        return testQuakesData
    }
}
