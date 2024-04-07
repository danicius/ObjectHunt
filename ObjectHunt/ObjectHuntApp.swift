//
//  ObjectHuntApp.swift
//  ObjectHunt
//
//  Created by Danielle Alvarez on 4/5/24.
//

import SwiftUI

@main
struct ObjectHuntApp: App {
    var body: some Scene {
        WindowGroup {
            Content_View()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
        
    }
}
