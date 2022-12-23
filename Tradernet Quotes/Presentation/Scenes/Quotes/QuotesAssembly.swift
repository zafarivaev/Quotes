//
//  QuotesAssembly.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import Foundation

protocol QuotesAssemblyProtocol: AnyObject {
    func assembleViewController() -> QuotesViewController
}

final class QuotesAssembly: QuotesAssemblyProtocol {
    func assembleViewController() -> QuotesViewController {
        let quoteService = RealtimeQuotesService()
        let router = QuotesRouter()
        let interactor = QuotesInteractor(quoteService: quoteService)
        let presenter = QuotesPresenter()
        let view = QuotesViewController()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
