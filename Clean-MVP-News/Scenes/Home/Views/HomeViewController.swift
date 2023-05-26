//
//  HomeViewController.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 13/04/2023.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func reloadTableView()
    func showError()
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {

    @IBOutlet private weak var newsTableView: UITableView!
    
    var presenter: HomeViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        presenter = HomeViewPresenter(homeView: self, router: NavigationRouter())
        setupTableView()
        presenter.getNewsBasedOnUserPreference()
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
    
    func showError() {
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let article = presenter.getNews(at: indexPath.row) else { return UITableViewCell() }
        return UITableViewCell()
    }
}
