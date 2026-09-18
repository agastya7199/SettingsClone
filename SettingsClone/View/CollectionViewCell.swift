//
//  CollectionViewCell.swift
//  SettingsClone
//
//  Created by Mouli Agastya on 8/28/26.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var collectionItemImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(collectionItemImage)
        contentView.backgroundColor = .lightGray
        NSLayoutConstraint.activate([
            collectionItemImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            collectionItemImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
