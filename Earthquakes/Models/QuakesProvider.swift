//
//  QuakesProvider.swift
//  Earthquakes-iOS
//
//  Created by Shen Beibei on 06/06/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

// Marking the class with @MainActor makes methods of this class execute on the main thread
@MainActor
class QuakesProvider: ObservableObject {
    @Published var quakes: [Quake] = []

    let client: QuakeClient

    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        quakes = latestQuakes
    }

    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }

    func location(for quake: Quake) async throws -> QuakeLocation {
        return try await client.quakeLocation(from: quake.detail)
    }

    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
}
