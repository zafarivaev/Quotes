//
//  QuoteDTO.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import Foundation

struct QuoteDTO: Decodable {
    /// Тикер
    let ticker: String
    /// Изменение в процентах относительно цены закрытия предыдущей торговой сессии
    var percentChange: Decimal?
    /// Биржа последней сделки
    var exchange: String?
    /// Название бумаги
    var name: String?
    /// Цена последней сделки
    var latestPrice: Decimal?
    /// Изменение цены последней сделки в пунктах относительно цены закрытия предыдущей торговой сессии
    var latestPriceChange: Decimal?
    
    enum CodingKeys: String, CodingKey {
        case ticker = "c"
        case percentChange = "pcp"
        case exchange = "ltr"
        case name
        case latestPrice = "ltp"
        case latestPriceChange = "chg"
    }
    
    init(
        ticker: String,
        percentChange: Decimal,
        exchange: String,
        name: String,
        latestPrice: Decimal,
        latestPriceChange: Decimal
    ) {
        self.ticker = ticker
        self.percentChange = percentChange
        self.exchange = exchange
        self.name = name
        self.latestPrice = latestPrice
        self.latestPriceChange = latestPriceChange
    }
}
