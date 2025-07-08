//
//  CountryTableViewCell.swift
//  CodingAssignment
//
//  Created by AI on 7/7/25.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    let nameRegionLabel = UILabel()
    let codeLabel = UILabel()
    let capitalLabel = UILabel()

    private let topRow = UIStackView()
    private let bottomRow = UIStackView()
    private let verticalStack = UIStackView()

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

    func configure(with country: Country) {
        nameRegionLabel.text = "\(country.name), \(country.region)"
        codeLabel.text = country.code
        capitalLabel.text = country.capital
    }
}
