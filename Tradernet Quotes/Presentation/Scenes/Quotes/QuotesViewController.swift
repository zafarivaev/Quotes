//
//  QuotesViewController.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 22/12/22.
//

import UIKit
import SnapKit

class QuotesViewController: UIViewController, QuotesPresenterToViewProtocol {

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        setupSubviews()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Quotes"
    }
    
    // MARK: - Properties
    
    var quoteModels: [QuoteUIModel] = []
    var presenter: QuotesViewToPresenterProtocol?
    
    // MARK: - Presenter to View Methods
    
    func displayQuotes(_ quoteModels: [QuoteUIModel]) {
        self.quoteModels = quoteModels
        tableView.reloadData()
        
        presenter?.didDisplayQuotes()
    }
    
    func refreshTableViewCell(at index: Int) {
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
    }
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    // MARK: - Subviews Setup
    
    private func setupSubviews() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UITableView Data Source

extension QuotesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.reuseIdentifier, for: indexPath) as? QuoteTableViewCell
        cell?.configure(with: quoteModels[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
