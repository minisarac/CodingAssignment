//
//  CountryFetchingClient.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

import Combine
import Foundation

struct CountryFetchingClient {
  
  enum FetchingError: Error {
    case connectionIssue
    case decodingIssue
  }
  
  static private let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json")!
  
  static func getCountries() -> AnyPublisher<[Country], FetchingError> {
    URLSession.shared
      .dataTaskPublisher(for: url)
      .mapError { _ in FetchingError.connectionIssue }
      .tryMap { output in
        do {
          return try JSONDecoder().decode([Country].self, from: output.data)
        } catch {
          throw FetchingError.decodingIssue
        }
      }
      .mapError { error in
        // Converting decoding and connection errors to our custom type
        (error as? FetchingError) ?? .connectionIssue
      }
      .eraseToAnyPublisher()
  }
}

