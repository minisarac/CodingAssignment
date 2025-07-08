//
//  CodingAssignmentTests.swift
//  CodingAssignmentTests
//
//  Created by Deniz Sarac on 7/8/25.
//

/// Unit tests for the CodingAssignment app, focusing on the Country model.

import Testing
import Foundation
@testable import CodingAssignment

/// Tests related to the Country data model, including decoding and search functionality.
@Suite("Country Model Tests")
struct CountryModelTests {

    /// Tests decoding a Country from JSON.
    @Test("Country decoding")
    func countryDecoding() async throws {
      let json = """
      [
        {"capital": "Paris", "code": "FR", "region": "Europe", "name": "France"}
      ]
      """.data(using: .utf8)!
      let countries = try JSONDecoder().decode([Country].self, from: json)
      #expect(countries.count == 1)
      #expect(countries[0].name == "France")
      #expect(countries[0].capital == "Paris")
      #expect(countries[0].code == "FR")
// I would expect the code below to fail:
//      #expect(countries[0].code == "SP")
      #expect(countries[0].region == "Europe")
    }

    /// Tests the Country's contains method for various search terms.
    @Test("Search functionality")
    func countryContains() async throws {
      let country = Country(capital: "Paris", code: "FR", region: "Europe", name: "France")
      #expect(country.contains("paris"))
      #expect(country.contains("france"))
      #expect(!country.contains("berlin"))
    }

    /// Tests that the Country id property matches its code.
    @Test("Country id property")
    func countryIDPropertyEqualsCode() async throws {
      let country = Country(capital: "Paris", code: "FR", region: "Europe", name: "France")
      #expect(country.id == country.code)
    }
}

