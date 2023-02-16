//
//  BoxOfficeListViewController.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/10.
//

import UIKit

final class BoxOfficeListViewController: UIViewController {
    //MARK: Property
    private lazy var boxOfficeListCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createListLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }()

    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }

    //MARK: Method

}

//MARK: UICollectionView Layout
extension BoxOfficeListViewController {
    private func createListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1.35))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
