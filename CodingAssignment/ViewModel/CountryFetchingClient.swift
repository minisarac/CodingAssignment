//
//  CountryFetchingClient.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

/// Provides networking functionality to fetch a list of countries from a remote endpoint.

import Combine
import Foundation

/// A client responsible for retrieving country data from a remote JSON endpoint.
struct CountryFetchingClient {
  
  /// Errors that may occur during the country fetching process.
  enum FetchingError: Error {
    /// Indicates a networking or connectivity issue.
    case connectionIssue
    /// Indicates a failure to decode received data into Country models.
    case decodingIssue
  }
  
  /// The static endpoint URL where the countries JSON can be fetched.
  static private let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json")!
  
  /// Fetches the list of countries asynchronously from the remote endpoint. Returns a publisher emitting either an array of Country or a FetchingError.
  static func getCountries() -> AnyPublisher<[Country], FetchingError> {
    URLSession.shared
      .dataTaskPublisher(for: url)
      // Map URLSession errors to FetchingError.connectionIssue.
      .mapError { _ in FetchingError.connectionIssue }
      // Try decoding the data into an array of Country, mapping errors accordingly.
      .tryMap { output in
        do {
          return try JSONDecoder().decode([Country].self, from: output.data)
        } catch {
          throw FetchingError.decodingIssue
        }
      }
      // Convert decoding and connection errors to FetchingError.
      .mapError { error in
        // Converting decoding and connection errors to our custom type
        (error as? FetchingError) ?? .connectionIssue
      }
      .eraseToAnyPublisher()
  }
}

