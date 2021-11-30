//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Rostislav Brož on 11/28/21.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
