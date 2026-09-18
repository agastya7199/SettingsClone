//
//  ViewController.swift
//  SettingsClone
//
//  Created by Mouli Agastya on 8/27/26.
//

import UIKit

class SettingsVC: UIViewController {
    // MARK: Properties
    
    var settingsList: SettingsModel? = nil
    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        
        setUpUI()
        settingsList = SettingsModel.getSettingsData()
    }
    
    // MARK: - Setting up the UI
    
    func setUpUI() {
        self.title = "Settings"
        self.view.backgroundColor = .lightGray
        view.addSubview(settingsTableView)
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -30),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Table view data source methods

extension SettingsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return settingsList?.items["section1Data"]?.count ?? 0
        case 1:
            return settingsList?.items["section2Data"]?.count ?? 0
        case 2:
            return settingsList?.items["section3Data"]?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell
        switch indexPath.section {
        case 0:
            let item = settingsList?.items["section1Data"]
            cell?.settingsTitleLabel.text = item?[indexPath.row].title
            cell?.settingsDescriptionLabel.text = item?[indexPath.row].subtitle
            cell?.settingsIcon.image = UIImage(systemName: item?[indexPath.row].icon ?? "applelogo")
        case 1:
            let item = settingsList?.items["section2Data"]
            cell?.settingsTitleLabel.text = item?[indexPath.row].title
            cell?.settingsIcon.image = UIImage(systemName: item?[indexPath.row].icon ?? "applelogo")
        case 2:
            let item = settingsList?.items["section3Data"]
            cell?.settingsTitleLabel.text = item?[indexPath.row].title
            cell?.settingsIcon.image = UIImage(systemName: item?[indexPath.row].icon ?? "applelogo")
        default:
            break
        }
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
}

// MARK: - Table view delegate methods

extension SettingsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 2, y: 2, width: view.frame.width, height: 30))
        headerView.backgroundColor = .systemGray
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(indexPath.row)")
        redirectToCollectionView()
    }
    func redirectToCollectionView() {
        let objDestinationVC = CollectionVC()
        self.navigationController?.pushViewController(objDestinationVC, animated: true)
    }
}
