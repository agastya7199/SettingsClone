//
//  SettingsTableViewCell.swift
//  SettingsClone
//
//  Created by Mouli Agastya on 8/27/26.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    static var identifier = "SettingsTableViewCell"
    
    let settingsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "applelogo")
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let settingsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let settingsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        super.setValue(reuseIdentifier, forKey: "reuseIdentifier")
        
        setUpUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUICell() {
        contentView.addSubview(settingsTitleLabel)
        contentView.addSubview(settingsIcon)
        contentView.addSubview(settingsDescriptionLabel)
        
        NSLayoutConstraint.activate([
            settingsIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            settingsIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            settingsTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            settingsTitleLabel.leadingAnchor.constraint(equalTo: settingsIcon.trailingAnchor, constant: 20),
            
            settingsDescriptionLabel.topAnchor.constraint(equalTo: settingsTitleLabel.bottomAnchor, constant: 5),
            settingsDescriptionLabel.leadingAnchor.constraint(equalTo: settingsIcon.trailingAnchor, constant: 20),
            settingsDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            settingsDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
}
