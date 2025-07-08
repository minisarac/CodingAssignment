//
//  CountryListUIView.swift
//  CodingAssignment
//
//  Created by Deniz Sarac on 7/7/25.
//

import UIKit
import SwiftUI

class CountryTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "country")
  }
  
  override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
      CountryData.instance.countries.count
  }
  
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




struct CountryTableViewRepresentable: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> CountryTableViewController {
    CountryTableViewController()
  }
  
  func updateUIViewController(_ uiViewController: CountryTableViewController, context: Context) {
    
  }
}

