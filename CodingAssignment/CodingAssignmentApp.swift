//
//  CodingAssignmentApp.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

import SwiftUI

@main
struct CodingAssignmentApp: App {  
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
