//
//  CountryData.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

import Foundation
import Combine

/// Observable data model responsible for fetching and storing country information.
/// This class provides a shared singleton instance and publishes updates to
/// the list of countries and any fetching errors.
@MainActor
class CountryData: ObservableObject {
  /// The list of countries fetched from the data source.
  @Published var countries: [Country] = []
  
  /// The most recent error that occurred during country fetching, if any.
  @Published var error: CountryFetchingClient.FetchingError?
  
  /// Shared singleton instance of `CountryData`.
  static let instance = CountryData()
  
  /// Starts the asynchronous loading of country data.
  /// This method triggers the `loadCountries()` async function.
  func start() {
    Task {
      await loadCountries()
    }
  }
  
  /// Holds the Combine subscription for the country fetching publisher.
  /// This is used to receive updates and handle completion events.
  var subscription: AnyCancellable?
  
  /// Asynchronously fetches countries and updates the published properties.
  ///
  /// Uses Combine to subscribe to the `CountryFetchingClient.getCountries()` publisher.
  /// On success, updates `countries` with the fetched list.
  /// On failure, updates `error` with the encountered fetching error.
  func loadCountries() async {
    subscription = CountryFetchingClient
      .getCountries()
      .sink { [weak self] completion in
        guard case .failure(let error) = completion else {
          return
        }
        self?.error = error
      } receiveValue: { [weak self] countries in
        self?.countries = countries
      }
  }
}
