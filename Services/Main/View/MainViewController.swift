//
//  MainViewController.swift
//  Super easy dev
//
//  Created by Александр Горелкин on 26.03.2024
//

import UIKit
import PinLayout
protocol MainViewProtocol: AnyObject {
    func displayFetchedServices()
    func displayError(error: String)
}

class MainViewController: UIViewController {
    // MARK: - Public
    var presenter: MainPresenterProtocol?
    private lazy var loader = DefaultLoader()
    private lazy var serviceTable: UITableView = {
        let tableView = UITableView()
        tableView.register(ServiceCell.self, forCellReuseIdentifier: ServiceCell.identifier)
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.delegate = self
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Сервисы"
        view.backgroundColor = .background
        view.addView(serviceTable)
        view.addView(loader)
        serviceTable.pin.top(view.pin.safeArea).left().right().bottom()
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loader.widthAnchor.constraint(equalToConstant: 10).isActive = true
        loader.heightAnchor.constraint(equalToConstant: 10).isActive = true
        presenter?.fetchServices()
    }
    
    
    
}


// MARK:  UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfPosts(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceCell.identifier, for: indexPath) as! ServiceCell
        cell.serviceModel = presenter?.service(for: indexPath)
        return cell
    }
    
    
    
    
}
// MARK:  UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectRowAt(indexPath)
    }
}
// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    func displayError(error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    func displayFetchedServices() {
        DispatchQueue.main.async {
            self.serviceTable.reloadData()
            self.loader.removeFromSuperview()
        }
    }
    
}
