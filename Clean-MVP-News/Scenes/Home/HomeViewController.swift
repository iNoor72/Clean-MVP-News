//
//  HomeViewController.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 13/04/2023.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func reloadTableView()
    func showError(error: NSError?)
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    @IBOutlet private weak var newsTableView: UITableView!
    @IBOutlet private weak var newsTypeButton: UIButton!
    
    var presenter: HomeViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HomeViewPresenter(homeView: self, router: NavigationRouter())
        setupTableView()
        setupView()
        presenter.getNewsBasedOnUserPreference()
    }
    
    private func setupTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UINib(nibName: AppConstants.TableViewCellsIdentifiers.NewsTableViewCellID, bundle: nil), forCellReuseIdentifier: AppConstants.TableViewCellsIdentifiers.NewsTableViewCellID)
        newsTableView.rowHeight = 107
    }
    
    private func setupView() {
        title = "News"
        newsTypeButton.layer.cornerRadius = 8.0
        newsTypeButton.setTitle(presenter.getNewsType().rawValue, for: .normal)
        if #available(iOS 14.0, *) { newsTypeButton.showsMenuAsPrimaryAction = true }
        setupButtonMenu()
    }
    
    private func setupButtonMenu() {
        if #available(iOS 14.0, *) {
            let allNewsItem = UIAction(title: "All News", image: UIImage(systemName: "list.bullet"), handler: { _ in
                UserDefaults.standard.set(NewsType.allNews.rawValue, forKey: AppConstants.UserDefaultsKeys.newsPreferenceKey)
                self.newsTypeButton.setTitle(self.presenter.getNewsType().rawValue, for: .normal)
                self.presenter.getNewsBasedOnUserPreference()
            })
            
            let healthNewsItem = UIAction(title: "Health News", image: UIImage(systemName: "stethoscope"), handler: { _ in
                UserDefaults.standard.set(NewsType.healthNews.rawValue, forKey: AppConstants.UserDefaultsKeys.newsPreferenceKey)
                self.newsTypeButton.setTitle(self.presenter.getNewsType().rawValue, for: .normal)
                self.presenter.getNewsBasedOnUserPreference()
            })
            
            let scienceNewsItem = UIAction(title: "Science News", image: UIImage(systemName: "atom"), handler: { _ in
                UserDefaults.standard.set(NewsType.scienceNews.rawValue, forKey: AppConstants.UserDefaultsKeys.newsPreferenceKey)
                self.newsTypeButton.setTitle(self.presenter.getNewsType().rawValue, for: .normal)
                self.presenter.getNewsBasedOnUserPreference()
            })
            
            let menuItems: [UIAction] = [allNewsItem, healthNewsItem, scienceNewsItem]
            
            let menu =
            UIMenu(title: "Select news type", image: nil, identifier: nil, options: [], children: menuItems)
            newsTypeButton.menu = menu
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
    
    func showError(error: NSError?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedFailureReason ?? "Failed to get data.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.TableViewCellsIdentifiers.NewsTableViewCellID, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        guard let article = presenter.getNews(at: indexPath.row) else { return UITableViewCell() }
        
        let newsData = NewsCellData(title: article.title, author: article.author, imageURL: article.urlToImage)
        cell.setupCell(with: newsData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.navigateToArticle(at: indexPath.row)
    }
}
