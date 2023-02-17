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
        return label
    }()


    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
