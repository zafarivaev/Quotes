//
//  QuoteTableViewCell.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 22/12/22.
//

import UIKit

final class QuoteTableViewCell: UITableViewCell {
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    public func configure(with quoteModel: QuoteUIModel) {
        tickerTitleLabel.text = quoteModel.quote.ticker
        
        if let exchange = quoteModel.quote.exchange, !exchange.isEmpty, let name = quoteModel.quote.name, !name.isEmpty {
            tickerSubtitleLabel.text = "\(exchange) | \(name)"
        }
        if let percent = quoteModel.quote.percentChange {
            percentChangeView.percentChangeLabel.text = "\(percent.withFormatPlusSign)%"
        }
        if let latestPrice = quoteModel.quote.latestPrice, let latestPriceChange = quoteModel.quote.latestPriceChange {
            pricesLabel.text = "\(latestPrice.withFormat) ( \(latestPriceChange.withFormatPlusSign) )"
        }
        
        switch quoteModel.state {
        case .basicNegative:
            percentChangeView.backgroundColor = .clear
            percentChangeView.percentChangeLabel.textColor = .systemRed
        case .basicPositive:
            percentChangeView.backgroundColor = .clear
            percentChangeView.percentChangeLabel.textColor = .systemGreen
        case .decreased:
            percentChangeView.backgroundColor = .systemRed
            percentChangeView.percentChangeLabel.textColor = .white
        case .increased:
            percentChangeView.backgroundColor = .systemGreen
            percentChangeView.percentChangeLabel.textColor = .white
        }
    }
    
    // MARK: - Subviews
    
    private let tickerTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let tickerSubtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    private let percentChangeView = PercentChangeView()
    
    private let pricesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Subviews Setup
    
    private func setupSubviews() {
        contentView.addSubview(tickerTitleLabel)
        contentView.addSubview(tickerSubtitleLabel)
        contentView.addSubview(percentChangeView)
        contentView.addSubview(pricesLabel)
        
        tickerSubtitleLabel.setContentCompressionResistancePriority(.init(250), for: .horizontal)
        pricesLabel.setContentCompressionResistancePriority(.init(251), for: .horizontal)
        
        tickerTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(10)
        }
        
        tickerSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(tickerTitleLabel.snp.bottom).offset(8)
            $0.left.equalTo(tickerTitleLabel)
            $0.right.equalTo(pricesLabel.snp.left)
            $0.bottom.equalToSuperview().offset(-8)
        }
        
        percentChangeView.snp.makeConstraints {
            $0.centerY.equalTo(tickerTitleLabel)
            $0.right.equalToSuperview().offset(-10)
        }
        
        pricesLabel.snp.makeConstraints {
            $0.centerY.equalTo(tickerSubtitleLabel)
            $0.right.equalTo(percentChangeView)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
}
