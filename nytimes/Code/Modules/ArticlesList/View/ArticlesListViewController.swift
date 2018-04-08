//
//  ArticlesListViewController.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


import UIKit


protocol ArticlesListViewControllerProtocol: BaseViewControllerProtocol {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: ArticlesListPresenterProtocol)
    func showArticles(articles: [ArticleViewModel])
}


class ArticlesListViewController: BaseViewController, ArticlesListViewControllerProtocol {
  
    // MARK: - Properties
    
    private var presenter: ArticlesListPresenterProtocol?
    private var articles: [ArticleViewModel] = [ArticleViewModel]()
    
    @IBOutlet weak var tvArticles: UITableView!
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    
    // MARK: - ArticlesListViewProtocol
    
    func set(presenter: ArticlesListPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func showArticles(articles: [ArticleViewModel]) {
        self.articles = articles
        self.tvArticles.reloadData()
    }
    
    // MARK: - Private methods
    
    private func configViews() {
        self.configTableView()
        self.presenter?.getArticles()
        
    }
    
    private func configTableView() {
        self.tvArticles.register(UINib(nibName: ArticleTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.reuseIdentifier)
        
        self.tvArticles.dataSource = self
        self.tvArticles.delegate = self
    }
    
    
}

extension ArticlesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseIdentifier) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        let articleViewModel = self.articles[indexPath.row]
        cell.config(articleViewModel: articleViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
