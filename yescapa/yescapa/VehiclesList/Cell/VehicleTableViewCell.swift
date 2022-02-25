//
//  VehicleTableViewCell.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 24/02/2022.
//

import Foundation
import UIKit

protocol VehicleTableViewCellProtocol {
    func configure(with model: Vehicle)
}

final class VehicleTableViewCell: UITableViewCell {
    
    static let identifier = "VehicleTableViewCellIdentifier"
    
    private lazy var vehicleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var vehicleMark: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Vehicle mark"
        return label
    }()
    
    private lazy var vehiclePrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "xx€/j"
        return label
    }()
    
    private lazy var vehicleDescriptionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            vehicleMark,
            vehiclePrice
        ])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var vehicleLocation: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Location"
        return label
    }()
    
    private lazy var vehicleRating: RatingView = {
        let ratingView = RatingView()
        return ratingView
    }()
    
    private lazy var vehicleInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            vehicleLocation,
            vehicleRating
        ])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            vehicleImageView,
            vehicleDescriptionStackView,
            vehicleInfoStackView
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var onReuse: () -> Void = {}
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        vehicleImageView.image = nil
        vehicleImageView.cancelImageLoad()
    }
}

// MARK: Private methods
private extension VehicleTableViewCell {
    func setupView() {
        contentView.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0).isActive = true
        
        vehicleImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        vehicleImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        vehicleImageView.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        
        vehicleDescriptionStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8.0).isActive = true
        vehicleDescriptionStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8.0).isActive = true
        vehicleDescriptionStackView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        vehicleInfoStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8.0).isActive = true
        vehicleInfoStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8.0).isActive = true
        vehicleInfoStackView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
}

extension VehicleTableViewCell: VehicleTableViewCellProtocol {
    func configure(with model: Vehicle) {
        if let mainImage = model.pictures.first, let url = URL(string: mainImage.url) {
            vehicleImageView.loadImage(with: mainImage.id, at: url)
        }
        vehicleMark.text = model.title
        vehiclePrice.text = model.getFormattedStartingPrice()
        
        vehicleLocation.text = model.location
        vehicleRating.rating = Int(model.reviewAverage.rounded())
        vehicleRating.count = model.reviewCount
    }
}
