//
//  VehiclesTableViewController.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 24/02/2022.
//

import UIKit

class VehiclesTableViewController: UITableViewController {
    
    var presenter: VehiclesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewController()
        presenter?.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VehicleTableViewCell.identifier, for: indexPath) as? VehicleTableViewCell else {
            return UITableViewCell()
        }
        presenter?.willShow(cell: cell, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelect(indexPath: indexPath)
    }
}

// MARK: Private methods
private extension VehiclesTableViewController {
    func setupTableViewController() {
        navigationItem.title = "YESCAPA"
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(VehicleTableViewCell.self, forCellReuseIdentifier: VehicleTableViewCell.identifier)
        
        if let appearance = navigationController?.navigationBar.standardAppearance {
            appearance.configureWithTransparentBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
}

// MARK: Protocols
extension VehiclesTableViewController: VehiclesViewControllerProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
    func show(viewController: UIViewController) {
        // TODO: show detail view
    }
}
