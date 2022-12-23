//
//  QuotesPresenter.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import Foundation

final class QuotesPresenter: QuotesViewToPresenterProtocol, QuotesInteractorToPresenterProtocol {
    
    var interactor: QuotesPresenterToInteractorProtocol?
    var router: QuotesPresenterToRouterProtocol?
    weak var view: QuotesPresenterToViewProtocol?
    
    // MARK: - View to Presenter Methods
    
    func viewDidLoad() {
        interactor?.fetchTickersList()
    }
    
    func didDisplayQuotes() {
        interactor?.subscribeForQuotes()
    }
    
    // MARK: Interactor to Presenter Methods
    
    func didFetchTickersList(_ quotes: [String]) {
        let quoteModels = quotes.map {
            QuoteUIModel(
                quote: QuoteDTO(
                    ticker: $0,
                    percentChange: 0,
                    exchange: "",
                    name: "",
                    latestPrice: 0,
                    latestPriceChange: 0
                ),
                state: .basicPositive
            )
        }
        view?.displayQuotes(quoteModels)
    }
    
    func didQuoteChange(quote: QuoteDTO) {
        guard let view = view else { return }
        if let index = view.quoteModels.firstIndex(where: { $0.quote.ticker == quote.ticker }) {
            let currentQuoteModel = view.quoteModels[index]
            if let currentPercentChange = currentQuoteModel.quote.percentChange {
                if let newPercentChange = quote.percentChange {
                    if newPercentChange == currentPercentChange {
                        currentQuoteModel.state = .basicPositive
                    } else if newPercentChange > currentPercentChange {
                        currentQuoteModel.state = .increased
                    } else {
                        currentQuoteModel.state = .decreased
                    }
                    currentQuoteModel.quote.percentChange = newPercentChange
                } else {
                    currentQuoteModel.state = currentPercentChange > 0 ? .basicPositive : .basicNegative
                }
            }

            if let exchange = quote.exchange, let name = quote.name {
                currentQuoteModel.quote.exchange = exchange
                currentQuoteModel.quote.name = name
            }
            if let latestPrice = quote.latestPrice, let latestPriceChange = quote.latestPriceChange {
                currentQuoteModel.quote.latestPrice = latestPrice
                currentQuoteModel.quote.latestPriceChange = latestPriceChange
            }
            view.refreshTableViewCell(at: index)
        }
    }
}
