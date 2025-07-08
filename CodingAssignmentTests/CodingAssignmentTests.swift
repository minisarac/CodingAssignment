//
//  CodingAssignmentTests.swift
//  CodingAssignmentTests
//
//  Created by Deniz Sarac on 7/8/25.
//

import Testing
import Foundation
@testable import CodingAssignment


@Suite("Country Model Tests")
struct CountryModelTests {

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

    @Test("Search functionality")
    func countryContains() async throws {
      let country = Country(capital: "Paris", code: "FR", region: "Europe", name: "France")
      #expect(country.contains("paris"))
      #expect(country.contains("france"))
      #expect(!country.contains("berlin"))
    }

    @Test("Country id property")
    func countryIDPropertyEqualsCode() async throws {
      let country = Country(capital: "Paris", code: "FR", region: "Europe", name: "France")
      #expect(country.id == country.code)
    }
}
