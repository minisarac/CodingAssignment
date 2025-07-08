//
//  Country.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

/// Defines the Country model representing essential information about a country.
struct Country: Codable {
  /// The capital city of the country.
  let capital: String
  /// The ISO code for the country.
  let code: String
  /// The region or continent where the country is located.
  var region: String
  /// The common name of the country.
  var name: String
}

/// Adds Identifiable conformance so each Country can be uniquely identified by its code.
extension Country: Identifiable {
  /// The stable identity of the country, using its code.
  var id: String { code }
}

extension Country {
  /// Returns true if the country's name or capital contains the given string (case-insensitive).
  /// - Parameter string: The search string to match against the name and capital.
  /// - Returns: True if the search string is found in the name or capital; false otherwise.
  func contains(_ string: String) -> Bool {
    let properties = [name, capital].map { $0.lowercased()}
    let query = string.lowercased()
    let matches = properties.filter { $0.contains(query)}
    return !matches.isEmpty
  }
}
