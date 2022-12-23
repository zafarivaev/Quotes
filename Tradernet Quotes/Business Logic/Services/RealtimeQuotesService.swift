//
//  RealtimeQuotesService.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import Foundation

protocol RealtimeQuotesServiceProtocol: AnyObject {
    func subscribeForQuotes(tickers: [String], callback: @escaping (QuoteDTO) -> ())
}

final class RealtimeQuotesService: RealtimeQuotesServiceProtocol {
    
    private let request = URLRequest(url: URL(string: "wss://wss.tradernet.ru")!)
    private lazy var socketClient: SocketClientProtocol = SocketClient(request: request)
    
    func subscribeForQuotes(tickers: [String], callback: @escaping (QuoteDTO) -> ()) {
        guard
            let quotesJSONData = try? JSONSerialization.data(
                withJSONObject: tickers
            ),
            let quotesJSONString = String(
                data: quotesJSONData,
                encoding: .utf8
            )
        else {
            return
        }
        
        let string = "[\"realtimeQuotes\", \(quotesJSONString)]"
        
        socketClient.subscribe(type: QuoteDTO.self, write: string) { quote in
            callback(quote)
        }
    }
}
