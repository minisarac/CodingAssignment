//
//  CountryTableViewCell.swift
//  CodingAssignment
//
//  Created by AI on 7/7/25.
//

import UIKit

/// A custom table view cell for displaying country information including the name, region, code, and capital.
class CountryTableViewCell: UITableViewCell {
    /// Label displaying the country's name and region.
    let nameRegionLabel = UILabel()
    /// Label displaying the country's code, aligned to the right.
    let codeLabel = UILabel()
    /// Label displaying the country's capital city, styled as a subheadline with secondary text color.
    let capitalLabel = UILabel()

    /// Horizontal stack view containing the nameRegionLabel and codeLabel, arranged on the top row.
    private let topRow = UIStackView()
    /// Horizontal stack view containing the capitalLabel on the bottom row.
    private let bottomRow = UIStackView()
    /// Vertical stack view containing the topRow and bottomRow stack views to layout the cell content vertically.
    private let verticalStack = UIStackView()

    /// Initializes the country table view cell, sets up its UI components and layout constraints.
    /// - Parameters:
    ///   - style: The cell style.
    ///   - reuseIdentifier: The reuse identifier for the cell.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        nameRegionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        codeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        codeLabel.textAlignment = .right
        capitalLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        capitalLabel.textColor = .secondaryLabel
        nameRegionLabel.numberOfLines = 1
        codeLabel.numberOfLines = 1
        capitalLabel.numberOfLines = 1

        // Top row: name/region and code
        topRow.axis = .horizontal
        topRow.alignment = .center
        topRow.distribution = .fill
        topRow.spacing = 8
        topRow.addArrangedSubview(nameRegionLabel)
        let topSpacer = UIView()
        topRow.addArrangedSubview(topSpacer)
        topRow.addArrangedSubview(codeLabel)
        topSpacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        topSpacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        nameRegionLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        codeLabel.setContentHuggingPriority(.required, for: .horizontal)

        // Bottom row: capital
        bottomRow.axis = .horizontal
        bottomRow.alignment = .center
        bottomRow.distribution = .fill
        bottomRow.spacing = 8
        bottomRow.addArrangedSubview(capitalLabel)
        let bottomSpacer = UIView()
        bottomRow.addArrangedSubview(bottomSpacer)
        bottomSpacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        bottomSpacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        capitalLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        // Vertical stack
        verticalStack.axis = .vertical
        verticalStack.spacing = 4
        verticalStack.addArrangedSubview(topRow)
        verticalStack.addArrangedSubview(bottomRow)

        contentView.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Configures the cell's labels with the data from a given `Country` model.
    /// - Parameter country: The `Country` instance containing the data to display.
    func configure(with country: Country) {
        nameRegionLabel.text = "\(country.name), \(country.region)"
        codeLabel.text = country.code
        capitalLabel.text = country.capital
    }
}
