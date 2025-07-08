//
//  CountryData.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

import Foundation
import Combine

@MainActor
class CountryData: ObservableObject {
  @Published var countries: [Country] = []
  @Published var error: CountryFetchingClient.FetchingError?
  
  static let instance = CountryData()
  
  func start() {
    Task {
      await loadCountries()
    }
  }
  
  var subscription: AnyCancellable?
  
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
