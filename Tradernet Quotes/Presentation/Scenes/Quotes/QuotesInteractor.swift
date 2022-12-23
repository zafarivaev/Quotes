//
//  QuotesInteractor.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import Foundation

final class QuotesInteractor: QuotesPresenterToInteractorProtocol {
    
    weak var presenter: QuotesInteractorToPresenterProtocol?
    private let quoteService: RealtimeQuotesServiceProtocol
    private var tickers: [String] = []
    
    init(quoteService: RealtimeQuotesServiceProtocol) {
        self.quoteService = quoteService
    }
    
    // MARK: - Presenter to Interactor Methods
    
    func fetchTickersList() {
        let tickers = [
            "RSTI","GAZP","MRKZ","RUAL","HYDR","MRKS","SBER","FEES","TGKA","VTBR","ANH.US","VICL.US",
            "BURG.US","NBL.US","YETI.US","WSFS.US","NIO.US","DXC.US","MIC.US","HSBC.US","EXPN.EU","GSK.EU",
            "SHP.EU","MAN.EU","DB1.EU","MUV2.EU","TATE.EU","KGF.EU","MGGT.EU","SGGD.EU"
        ]
        self.tickers = tickers
        presenter?.didFetchTickersList(tickers)
    }
    
    func subscribeForQuotes() {
        quoteService.subscribeForQuotes(tickers: tickers) { [weak self] quote in
            self?.presenter?.didQuoteChange(quote: quote)
        }
    }
}
