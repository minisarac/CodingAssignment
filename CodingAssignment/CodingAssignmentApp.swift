/// The main app entry point configuring the root SwiftUI scene and environment.
//
//  CodingAssignmentApp.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

import SwiftUI

/// The main application struct for the CodingAssignment app.
@main
struct CodingAssignmentApp: App {  
    /// Sets up the window group, root view, and initializes the shared CountryData instance.
    var body: some Scene {
        WindowGroup {
            IntroView()
              .environmentObject(CountryData.instance)
              .onAppear {
                CountryData.instance.start()
              }
        }
    }
}

