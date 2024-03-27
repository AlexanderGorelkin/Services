//
//  ServiceCell.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import UIKit
import PinLayout
final class ServiceCell: UITableViewCell {
    static let identifier = String(describing: ServiceCell.self)
    private lazy var iconView = DefaultImageView()
    private lazy var nameLabel = DefaultLabel(textAligmanet: .left)
    private lazy var descriptionLabel = DefaultLabel(textAligmanet: .left)
    
    var serviceModel: ServiceModel? {
        didSet {
            nameLabel.text = serviceModel?.name
            descriptionLabel.text = serviceModel?.description
            Task {
                iconView.image = await IconService.getCoinImage(imageName: serviceModel!.iconURL)
            }
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        backgroundColor = .clear
        addView(iconView)
        addView(nameLabel)
        addView(descriptionLabel)
        NSLayoutConstraint.activate([
            
            
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            iconView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            nameLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 15),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 15),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
