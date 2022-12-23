//
//  QuoteUIModel.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import Foundation

class QuoteUIModel {
    enum State {
        case basicPositive
        case basicNegative
        case decreased
        case increased
    }
    var quote: QuoteDTO
    var state: State
    
    init(quote: QuoteDTO, state: State) {
        self.quote = quote
        self.state = state
    }
}
