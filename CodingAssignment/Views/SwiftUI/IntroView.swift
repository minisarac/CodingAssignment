//
//  IntroView.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

import SwiftUI

enum DesignFramework {
  case uiKit
  case swiftUI
  
  var name: String {
    switch self {
    case .uiKit:
      "UIKit"
    case .swiftUI:
      "SwiftUI"
    }
  }
}

struct IntroView: View {
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

#Preview {
    IntroView()
}
