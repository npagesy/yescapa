//
//  VehicleDetailViewController.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import UIKit

class VehicleDetailViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    // TODO: create vehicule detail view for cell & detail view
    lazy var vehicleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var vehicleMark: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var vehiclePrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .right
        return label
    }()
    
    lazy var vehicleDescriptionStackView: UIStackView = {
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
    
    lazy var vehicleLocation: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var vehicleRating: RatingView = {
        let ratingView = RatingView()
        return ratingView
    }()
    
    lazy var vehicleInfoStackView: UIStackView = {
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
    
    lazy var ownerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var ownerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var vehicleOwnerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            ownerImageView,
            ownerLabel
        ])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var vehicleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            vehicleDescriptionStackView,
            vehicleInfoStackView,
            vehicleOwnerStackView
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var presenter: VehicleDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraintLayout()
        presenter?.didLoad()
    }
    
    private func setupConstraintLayout() {
        view.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        contentView.addSubview(vehicleImageView)
        vehicleImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        vehicleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        vehicleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        vehicleImageView.heightAnchor.constraint(equalToConstant: 450.0).isActive = true
        
        contentView.addSubview(vehicleStackView)
        vehicleStackView.topAnchor.constraint(equalTo: vehicleImageView.bottomAnchor, constant: 8.0).isActive = true
        vehicleStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        vehicleStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0).isActive = true
        vehicleStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0).isActive = true
        
        vehicleMark.widthAnchor.constraint(equalToConstant: 250.0).isActive = true
        vehicleDescriptionStackView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        vehicleInfoStackView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
         ownerImageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
    }
}

extension VehicleDetailViewController: VehicleDetailViewControllerProtocol {
    func configureView(model: Vehicle) {
        if let mainImage = model.pictures.first, let url = URL(string: mainImage.url) {
            vehicleImageView.loadImage(with: mainImage.id, at: url)
        }
        vehicleMark.text = model.title
        vehiclePrice.text = model.getFormattedStartingPrice()
        
        vehicleLocation.text = model.location
        vehicleRating.rating = model.roundedReview()
        vehicleRating.count = model.reviewCount
        
        ownerLabel.text = model.ownerString
        if let ownerPictureURL = URL(string: model.ownerPictureURL) {
            ownerImageView.loadImage(with: model.ownerString, at: ownerPictureURL)
        }
    }
}
