//
//  handball_referee_companionApp.swift
//  handball referee companion WatchKit Extension
//
//  Created by personal on 17.10.21.
//

import SwiftUI

@main
struct handball_referee_companionApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
