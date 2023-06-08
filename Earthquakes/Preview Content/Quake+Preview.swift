//
//  Quake+Preview.swift
//  Earthquakes-iOS
//
//  Created by Shen Beibei on 08/06/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

extension Quake {
    static var preview: Quake {
        var quake = Quake(magnitude: 0.34,
                          place: "Shakey Acres",
                          time: Date(timeIntervalSinceNow: -1000),
                          code: "nc73649170",
                          detail: URL(string: "https://example.com")!)
        quake.location = QuakeLocation(latitude: 38.8093338, longitude: -122.7968369)
        return quake
    }
}
