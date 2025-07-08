//
//  CountryListView.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

import SwiftUI

/// A view that displays a searchable list of countries.
/// 
/// This view observes the `CountryData` environment object to present
/// a filtered list of countries based on the user's search input. It also
/// listens for error states in the data and presents an alert when an error occurs.
struct CountryListView: View {
  /// Environment object that supplies country data and error states.
  @EnvironmentObject var countryData: CountryData
  
  /// State variable for the user's search query.
  @State private var searchText = ""
  
  /// State variable that determines whether the error alert is presented.
  @State private var showErrorAlert = false
  
  /// The main content and layout of the country list view.
  ///
  /// Displays a list of countries filtered by the current search text.
  /// Each country is shown with its name, region, code, and capital.
  /// Includes a searchable text field and dynamically presents an alert
  /// if an error occurs in the data environment.
  var body: some View {
      List(countryData.countries) { country in
        if searchText.isEmpty || country.contains(searchText) {
          VStack {
            HStack {
              Text("\(country.name), \(country.region)")
              Spacer()
              Text(country.code)
            }
            HStack {
              Text(country.capital)
                .foregroundStyle(.secondary)
                .font(.subheadline)
              Spacer()
            }
          }
        }
      }
      .searchable(text: $searchText)
      .navigationTitle("Countries")
      .navigationBarTitleDisplayMode(.large)
      .alert(isPresented: $showErrorAlert) {
        Alert(
          title: Text("Error"),
          message: Text(errorMessage),
          dismissButton: .default(Text("OK")) {
            countryData.error = nil
          }
        )
      }
      .onChange(of: countryData.error) { _, newValue in
        showErrorAlert = (newValue != nil)
      }
  }
  
  /// A user-friendly error message based on the current error state.
  ///
  /// Returns a specific message depending on whether the error is a connection issue or decoding issue.
  /// If no known error is set, returns a generic unknown error message.
  private var errorMessage: String {
    if let error = countryData.error {
      switch error {
      case .connectionIssue:
        return "A connection error occurred while fetching data. Please check your internet connection."
      case .decodingIssue:
        return "Failed to decode the server response. Please try again later."
      }
    }
    return "An unknown error occurred."
  }
}


#Preview {
    CountryListView()
    .environmentObject(CountryData())
}
