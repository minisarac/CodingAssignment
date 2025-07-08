//
//  CountryListView.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

import SwiftUI

struct CountryListView: View {
  @EnvironmentObject var countryData: CountryData
  @State private var searchText = ""
  @State private var showErrorAlert = false
  
  
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
