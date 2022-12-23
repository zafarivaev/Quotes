//
//  PercentChangeView.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import UIKit
import SnapKit

final class PercentChangeView: UIView {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        addSubview(percentChangeLabel)
        
        percentChangeLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    
    public let percentChangeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
}
