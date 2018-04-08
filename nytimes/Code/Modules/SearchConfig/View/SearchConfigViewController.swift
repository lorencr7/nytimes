//
//  SearchConfigViewController.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


import UIKit


protocol SearchConfigViewControllerProtocol: BaseViewControllerProtocol {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: SearchConfigPresenterProtocol)
    
    func showTypeOfArticles(typeOfArticles: [String])
    func showPeriods(periods: [String])
    func showArticleSource()
    func hideArticleSource()
}


class SearchConfigViewController: BaseViewController, SearchConfigViewControllerProtocol {
  
    // MARK: - Properties
    
    private var presenter: SearchConfigPresenterProtocol?
    
    @IBOutlet weak var lbTypeOfArticle: UILabel!
    @IBOutlet weak var sgTypeOfArticle: UISegmentedControl!
    @IBOutlet weak var lbRecentPeriod: UILabel!
    @IBOutlet weak var sgRecentPeriod: UISegmentedControl!
    @IBOutlet weak var lbFacebook: UILabel!
    @IBOutlet weak var swFacebook: UISwitch!
    @IBOutlet weak var lbTwitter: UILabel!
    @IBOutlet weak var swTwitter: UISwitch!
    @IBOutlet weak var svArticleSource: UIStackView!
    @IBOutlet weak var btSearch: UIButton!
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    // MARK: - Actions
    
    @IBAction func sgTypeOfArticleValueChanged(_ sender: Any) {
        if let typeOfArticle = self.sgTypeOfArticle.titleForSegment(at: self.sgTypeOfArticle.selectedSegmentIndex) {
            self.presenter?.typeOfArticlesChanged(typeOfArticle: typeOfArticle)
        }
    }
    
    @IBAction func btSearchPressed(_ sender: Any) {
        if let typeOfArticle = self.sgTypeOfArticle.titleForSegment(at: self.sgTypeOfArticle.selectedSegmentIndex),
            let period = self.sgRecentPeriod.titleForSegment(at: self.sgRecentPeriod.selectedSegmentIndex) {
            self.presenter?.searchPressed(typeOfArticle: typeOfArticle, period: period, sharedFacebook: self.swFacebook.isOn, sharedTwitter: self.swTwitter.isOn)
        }
    }
    
    // MARK: - SearchConfigViewProtocol
    
    func set(presenter: SearchConfigPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func showTypeOfArticles(typeOfArticles: [String]) {
        self.configSegmented(segmented: self.sgTypeOfArticle, options: typeOfArticles)
    }
    
    func showPeriods(periods: [String]) {
        self.configSegmented(segmented: self.sgRecentPeriod, options: periods)
    }
    
    func showArticleSource() {
        self.svArticleSource.isHidden = false
    }
    
    func hideArticleSource() {
        self.svArticleSource.isHidden = true
    }
    
    // MARK: - Private methods
    
    private func configViews() {
        
        self.title = "Search".localized
        self.configLabels()
        self.configButtons()
        self.presenter?.getTypeOfArticles()
        self.presenter?.getPeriods()
        self.hideArticleSource()
    }
    
    private func configLabels() {
        self.lbTypeOfArticle.text = "Type of article".localized
        self.lbRecentPeriod.text = "Period".localized
        self.lbFacebook.text = "Facebook".localized
        self.lbTwitter.text = "Twitter".localized
    }
    
    private func configSegmented(segmented: UISegmentedControl, options: [String]) {
        segmented.removeAllSegments()
        for option in options {
            segmented.insertSegment(withTitle: option, at: segmented.numberOfSegments, animated: false)
        }
        segmented.selectedSegmentIndex = 0
    }
    
    private func configButtons() {
        self.btSearch.setTitle("Search".localized, for: .normal)
    }
    

    
}
