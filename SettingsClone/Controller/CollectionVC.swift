//
//  CollectionVC.swift
//  SettingsClone
//
//  Created by Mouli Agastya on 8/28/26.
//

import UIKit

class CollectionVC: UIViewController {
    let demoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collection View"
        demoCollectionView.dataSource = self
        setUpUI()
    }
    
    func setUpUI() {
        view.addSubview(demoCollectionView)
        
        NSLayoutConstraint.activate([
            demoCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            demoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            demoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            demoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        cell?.titleLabel.text = "\(indexPath.row)"
        cell?.collectionItemImage.image = UIImage(named: "Shawshank")
        return cell ?? UICollectionViewCell()
    }
}
