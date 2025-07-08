//
//  IntroView.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

/// Displays the introductory view allowing users to select between different app UI frameworks.
import SwiftUI

/// Represents a UI framework option available in the app.
enum DesignFramework {
  /// A user-friendly display name for the UI framework.
  var name: String {
    switch self {
    case .uiKit:
      "UIKit"
    case .swiftUI:
      "SwiftUI"
    }
  }
  
  case uiKit
  case swiftUI
}

/// Introductory SwiftUI view with navigation to different app versions.
struct IntroView: View {
    /// The main content view with navigation options.
    var body: some View {
      NavigationView {
        VStack {
          makeButton(for: .swiftUI)
          makeButton(for: .uiKit)
        }
        .font(.headline)
        .navigationTitle("App Versions")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
  
  /// Creates a navigation button for the specified UI framework type.
  func makeButton(for type: DesignFramework) -> some View {
    NavigationLink {
      switch type {
      case .uiKit:
        CountryTableViewRepresentable()
      case .swiftUI:
        CountryListView()
      }
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 20)
          .foregroundStyle(.blue)
        Text(type.name)
          .foregroundStyle(.white)
      }
      .frame(width: 200, height: 100)
    }
  }
  
}

/// Preview for IntroView.
#Preview {
    IntroView()
}
