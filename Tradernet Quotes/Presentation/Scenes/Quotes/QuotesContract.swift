//
//  QuotesContract.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import UIKit

/// ViewController
protocol QuotesPresenterToViewProtocol: AnyObject {
    var quoteModels: [QuoteUIModel] { get }
    func displayQuotes(_ quoteModels: [QuoteUIModel])
    func refreshTableViewCell(at index: Int)
}

/// Presenter
protocol QuotesViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didDisplayQuotes()
}

/// Interactor
protocol QuotesPresenterToInteractorProtocol: AnyObject {
    func fetchTickersList()
    func subscribeForQuotes()
}

/// Presenter
protocol QuotesInteractorToPresenterProtocol: AnyObject {
    func didFetchTickersList(_ tickers: [String])
    func didQuoteChange(quote: QuoteDTO)
}

/// Router
protocol QuotesPresenterToRouterProtocol: AnyObject {

}
