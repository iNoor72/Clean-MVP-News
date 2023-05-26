//
//  HomeViewController.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 13/04/2023.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func reloadTableView()
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {

    @IBOutlet private weak var newsTableView: UITableView!
    
    var presenter: HomeViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        presenter = HomeViewPresenter(homeView: self, router: NavigationRouter())
        setupTableView()
    }
    
    private func setupTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
