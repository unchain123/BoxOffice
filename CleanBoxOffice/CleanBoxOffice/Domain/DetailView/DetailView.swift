//
//  DetailView.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/27.
//

import UIKit

final class DetailViewController: UIViewController {
//MARK: Properties
    private let posterView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus")
        return image
    }()

    private let director: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center

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
        return stackView
    }()

    private let productionYear: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center

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
        return stackView
    }()

    private let openDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center

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
        return stackView
    }()

    private let showTime: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center

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
        return stackView
    }()

    private let typeName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center

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
        return stackView
    }()

    private let nations: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center

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
        return stackView
    }()

    private let genres: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center

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
        return stackView
    }()

    private let actors: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center

        return label
    }()

    private let actorsDetail: UILabel = {
        let label = UILabel()

        return label
    }()

    private let actorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()

    private let detailTotalView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()

    //MARK: ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddSubView()
    }

    //MARK: Method

    private func setAddSubView() {
        view.addSubview(posterView)
        view.addSubview(detailTotalView)

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

    }
}
