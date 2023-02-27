//
//  BoxOfficeListViewController.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/10.
//

import UIKit

private enum Section {
    case main
}

final class BoxOfficeListViewController: UIViewController {
    //MARK: Property
    private typealias DiffableDateSource = UICollectionViewDiffableDataSource<Section, BoxOfficeList>

    private var listDataSource: DiffableDateSource?

    private lazy var boxOfficeListCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createListLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.refreshControl = refreshControl
        return collectionView
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshCollectionView), for: .valueChanged)
        return refresh
    }()

    private lazy var datePickButton: UIButton = {
        let button = UIButton()
        var attString = AttributedString("날짜선택")
        attString.font = .systemFont(ofSize: 16, weight: .bold)

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = attString
        button.configuration = configuration
        button.addTarget(self, action: #selector(openCalendar), for: .touchUpInside)
        return button
    }()

    private let viewModel = BoxOfficeListViewModel()

    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        viewModel.viewDidLoad(targetDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())?.today ?? "")
        viewModel.boxOfficeDelegate = self
        viewModel.calendarDelegate = self
    }

    //MARK: Method

    private func setUpViewController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: datePickButton)
        navigationItem.title = Calendar.current.date(byAdding: .day, value: -1, to: Date())?.boxOfficeDate ?? ""
        addSubView()
        setConstraint()
        self.boxOfficeListCollectionView.register(
            ListCollectionViewCell.self,
            forCellWithReuseIdentifier: ListCollectionViewCell.reuseIdentifier
        )
        listDataSource = configureDataSource()
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            //MARK: CollectionView
            boxOfficeListCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            boxOfficeListCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            boxOfficeListCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boxOfficeListCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func addSubView() {
        view.addSubview(boxOfficeListCollectionView)
    }

    @objc private func refreshCollectionView() {
        boxOfficeListCollectionView.refreshControl?.beginRefreshing()
        DispatchQueue.main.async {
            self.viewModel.viewDidLoad()
            self.boxOfficeListCollectionView.refreshControl?.endRefreshing()
        }
    }

    @objc private func openCalendar() {
        let calendar = CalendarViewController()
        calendar.modalPresentationStyle = UIModalPresentationStyle.pageSheet
        calendar.calendarDelegate = self
        self.present(calendar, animated: true)
    }
}

//MARK: UICollectionView Layout
extension BoxOfficeListViewController {
    private func createListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1.35))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       repeatingSubitem: item,
                                                       count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                      leading: 5,
                                                      bottom: 5,
                                                      trailing: 5)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }

//MARK: DiffableDataSource
    private func configureDataSource() -> DiffableDateSource? {
        let dataSource = DiffableDateSource(collectionView: boxOfficeListCollectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: BoxOfficeList) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier, for: indexPath) as? ListCollectionViewCell else { return ListCollectionViewCell() }
            cell.configureCell(product: itemIdentifier)
            return cell
        }
        return dataSource
    }
}

//MARK: BoxOfficeListDelegate
extension BoxOfficeListViewController: BoxOfficeListDelegate {
    func applySnapshot(input: [BoxOfficeList]) {
        var snapShot = NSDiffableDataSourceSnapshot<Section, BoxOfficeList>()
            snapShot.appendSections([.main])
            snapShot.appendItems(input, toSection: .main)

        listDataSource?.apply(snapShot, animatingDifferences: true)
    }
}

//MARK: CalendarDelegate
extension BoxOfficeListViewController: CalendarDelegate {
    func chooseDate(targetDate: String) {
        navigationItem.title = targetDate
        viewModel.viewDidLoad(targetDate: targetDate)
    }
}
