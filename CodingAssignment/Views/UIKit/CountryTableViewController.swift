//
//  CountryListUIView.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

/// Displays a list of countries using a UIKit table view, with SwiftUI interoperability.
import UIKit
import SwiftUI

/// A UITableViewController presenting a list of countries from CountryData.
class CountryTableViewController: UITableViewController {
  
  /// Sets up the table view and registers the cell.
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "country")
  }
  
  /// Returns the total number of countries.
  override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
      CountryData.instance.countries.count
  }
  
  /// Dequeues and configures a cell with country data for the given row.
  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "country") as? CountryTableViewCell else {
      return UITableViewCell()
    }
    let country = CountryData.instance.countries[indexPath.row]
    cell.configure(with: country)
    return cell
  }
}

/// A SwiftUI representable wrapper for CountryTableViewController.
struct CountryTableViewRepresentable: UIViewControllerRepresentable {
  /// Creates and returns a CountryTableViewController instance.
  func makeUIViewController(context: Context) -> CountryTableViewController {
    CountryTableViewController()
  }
  
  /// No-op for this simple wrapper; updates are not needed.
  func updateUIViewController(_ uiViewController: CountryTableViewController, context: Context) {
    
  }
}

