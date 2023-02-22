//
//  ListCollectionViewCell.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/17.
//

import UIKit

final class ListCollectionViewCell: UICollectionViewListCell {
    //MARK: Properties
    private let viewModel = BoxOfficeListViewModel()
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
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()

    private let attendanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)

        return label
    }()

    private let rankStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return stackView
    }()

    private let informationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stackView
    }()

    private let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(totalStackView)
        setAddSubView()
        setConstraint()
        self.accessories = [.disclosureIndicator()]
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    //MARK: Method
    private func setAddSubView() {
        rankStackView.addArrangedSubview(rankLabel)
        rankStackView.addArrangedSubview(rankChangeLabel)

        informationStackView.addArrangedSubview(movieNameLabel)
        informationStackView.addArrangedSubview(attendanceLabel)

        totalStackView.addArrangedSubview(rankStackView)
        totalStackView.addArrangedSubview(informationStackView)
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            //MARK: rankStackView
            totalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            totalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            totalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            totalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            rankStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.15),

            informationStackView.leadingAnchor.constraint(equalTo: rankStackView.trailingAnchor, constant: 30)
        ])
    }

    func configureCell(product: BoxOfficeList) {
            rankLabel.text = product.rank
            rankChangeLabel.text = product.isNewRanked
            attendanceLabel.text = product.audienceAttendance
            movieNameLabel.text = product.movieName
    }
}
