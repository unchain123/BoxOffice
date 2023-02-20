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
    private typealias DiffableDateSource = UICollectionViewDiffableDataSource<Section, BoxOfficeResult>

    private var listDataSource: DiffableDateSource?
    private var snapShot = NSDiffableDataSourceSnapshot<Section, BoxOfficeResult>()

    private lazy var boxOfficeListCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createListLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }()

    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "2023.02.19"
        addSubView()
        setConstraint()
        snapShot.appendSections([.main])
        listDataSource?.apply(snapShot, animatingDifferences: false)
        boxOfficeListCollectionView.register(
            ListCollectionViewCell.self,
            forCellWithReuseIdentifier: ListCollectionViewCell.reuseIdentifier
        )
        listDataSource = configureDataSource()
    }

    //MARK: Method
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
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }

//MARK: DiffableDataSource
    private func configureDataSource() -> DiffableDateSource? {
        let dataSource = DiffableDateSource(collectionView: boxOfficeListCollectionView) { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier, for: indexPath) as? ListCollectionViewCell else { return ListCollectionViewCell() }
            cell.configureCell()
            return cell
        }
        return dataSource
    }
}
