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
    private var snapShot = NSDiffableDataSourceSnapshot<Section, BoxOfficeList>()

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

    private let datePickButton: UIButton = {
        let button = UIButton()
        var attString = AttributedString("날짜선택")
        attString.font = .systemFont(ofSize: 16, weight: .bold)

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = attString
        button.configuration = configuration
        button.addTarget(BoxOfficeListViewController.self, action: #selector(openCalendar), for: .valueChanged)
        return button
    }()

    private let viewModel = BoxOfficeListViewModel()

    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        viewModel.viewDidLoad()
        viewModel.delegate = self
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
            self.snapShot.reloadSections([.main])
            self.viewModel.viewDidLoad()
            self.boxOfficeListCollectionView.refreshControl?.endRefreshing()
        }
    }

    @objc private func openCalendar() {

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
        guard snapShot.numberOfSections == 0 else { return }

        snapShot.appendSections([.main])
        snapShot.appendItems(input, toSection: .main)
        listDataSource?.apply(snapShot, animatingDifferences: true)
    }
}
