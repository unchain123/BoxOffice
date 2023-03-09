//
//  DetailView.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/27.
//

import UIKit

final class DetailViewController: UIViewController {
//MARK: Properties
    private let detailScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isDirectionalLockEnabled = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private let posterView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let director: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    private let directorDetail: UILabel = {
        let label = UILabel()

        return label
    }()

    private let directorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()

    private let productionYear: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        return label
    }()

    private let productionYearDetail: UILabel = {
        let label = UILabel()

        return label
    }()

    private let productionYearStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()

    private let openDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        return label
    }()

    private let openDateDetail: UILabel = {
        let label = UILabel()

        return label
    }()

    private let openDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()

    private let showTime: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        return label
    }()

    private let showTimeDetail: UILabel = {
        let label = UILabel()

        return label
    }()

    private let showTimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()

    private let typeName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        return label
    }()

    private let typeNameDetail: UILabel = {
        let label = UILabel()

        return label
    }()

    private let typeNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()

    private let nations: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        return label
    }()

    private let nationsDetail: UILabel = {
        let label = UILabel()

        return label
    }()

    private let nationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()

    private let genres: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        return label
    }()

    private let genresDetail: UILabel = {
        let label = UILabel()

        return label
    }()

    private let genreStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()

    private let actors: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()

    private let actorsDetail: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let actorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let detailTotalView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    //MARK: ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setAddSubView()
        setConstraints()
    }

    //MARK: Method

    private func setAddSubView() {
        view.addSubview(detailScrollView)

        detailScrollView.addSubview(posterView)
        detailScrollView.addSubview(detailTotalView)
        detailScrollView.addSubview(actorStackView)

        //MARK: detailTotalView
        detailTotalView.addArrangedSubview(directorStackView)
        detailTotalView.addArrangedSubview(productionYearStackView)
        detailTotalView.addArrangedSubview(openDateStackView)
        detailTotalView.addArrangedSubview(showTimeStackView)
        detailTotalView.addArrangedSubview(typeNameStackView)
        detailTotalView.addArrangedSubview(nationStackView)
        detailTotalView.addArrangedSubview(genreStackView)

        directorStackView.addArrangedSubview(director)
        directorStackView.addArrangedSubview(directorDetail)

        productionYearStackView.addArrangedSubview(productionYear)
        productionYearStackView.addArrangedSubview(productionYearDetail)

        openDateStackView.addArrangedSubview(openDate)
        openDateStackView.addArrangedSubview(openDateDetail)

        showTimeStackView.addArrangedSubview(showTime)
        showTimeStackView.addArrangedSubview(showTimeDetail)

        typeNameStackView.addArrangedSubview(typeName)
        typeNameStackView.addArrangedSubview(typeNameDetail)

        nationStackView.addArrangedSubview(nations)
        nationStackView.addArrangedSubview(nationsDetail)

        genreStackView.addArrangedSubview(genres)
        genreStackView.addArrangedSubview(genresDetail)

        actorStackView.addArrangedSubview(actors)
        actorStackView.addArrangedSubview(actorsDetail)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            //MARK: detailScrollView
            detailScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            posterView.topAnchor.constraint(equalTo: detailScrollView.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor, constant: 10),
            posterView.trailingAnchor.constraint(equalTo: detailScrollView.trailingAnchor, constant: -10),
            posterView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            posterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),

            detailTotalView.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 5),
            detailTotalView.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor, constant: 10),
            detailTotalView.trailingAnchor.constraint(equalTo: detailScrollView.trailingAnchor, constant: -10),

            actorStackView.topAnchor.constraint(equalTo: detailTotalView.bottomAnchor, constant: 5),
            actorStackView.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor),
            actorStackView.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor, constant: 20),
            actorStackView.trailingAnchor.constraint(equalTo: detailScrollView.trailingAnchor, constant: -10)
        ])
    }
}
