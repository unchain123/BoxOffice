//
//  ListCollectionViewCell.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/17.
//

import UIKit

final class ListCollectionViewCell: UICollectionViewCell {
    //MARK: Properties
    static let reuseIdentifier = "ListIdentifier"

    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let rankChangeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let attendanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let rankStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        return stackView
    }()

    private let informationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.axis = .vertical
        return stackView
    }()

    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAddSubView()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    //MARK: Method
    private func setAddSubView() {
        contentView.addSubview(rankStackView)
        rankStackView.addArrangedSubview(rankLabel)
        rankStackView.addArrangedSubview(rankChangeLabel)

        contentView.addSubview(informationStackView)
        informationStackView.addArrangedSubview(movieNameLabel)
        informationStackView.addArrangedSubview(attendanceLabel)
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            //MARK: rankStackView
            rankStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rankStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            rankStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            //MARK: informationStackView
            informationStackView.leadingAnchor.constraint(equalTo: rankStackView.trailingAnchor),
            informationStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            informationStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            informationStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
