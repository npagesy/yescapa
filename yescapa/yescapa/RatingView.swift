//
//  RatingView.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import UIKit

class RatingView: UIView {
    private let imageViews: [UIImageView]
    private let ratingCount: UILabel
    
    public var rating: Int = 0 {
        didSet {
            for i in 0..<5 {
                imageViews[i].tintColor = i < rating ? .purple : .gray
            }
        }
    }
    
    public var count: Int = 0 {
        didSet {
            ratingCount.text = "\(count)"
        }
    }
    
    public init() {
        imageViews = (0..<5).map { _ in
            UIImageView(image: UIImage(systemName: "star.fill"))
        }
        
        ratingCount = UILabel()
        
        super.init(frame: .zero)
        directionalLayoutMargins = .zero
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for view in imageViews {
            stackView.addArrangedSubview(view)
        }
        stackView.addArrangedSubview(ratingCount)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
