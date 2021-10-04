//
//  CardView.swift
//  iOS Bootcamp Challenge
//
//  Created by Marlon David Ruiz Arroyave on 28/09/21.
//

import UIKit

class CardView: UIView {

    private let margin: CGFloat = 30
    var card: Card?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var itemsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private func createItemLabel(name: String, description: String) -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = " \(name.capitalized): \(description) "
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }

    required init(card: Card) {
        self.card = card
        super.init(frame: .zero)
        setup()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupUI()
    }

    private func setup() {
        guard let card = card else { return }

        card.items.forEach { item in
            let last = itemsContainer.subviews.last
            let view = createItemLabel(name: item.title, description: item.description)
            itemsContainer.addSubview(view)

            if let last = last {
                view.topAnchor.constraint(equalTo: last.bottomAnchor, constant: margin).isActive = true
            } else {
                view.topAnchor.constraint(equalTo: itemsContainer.topAnchor).isActive = true
            }
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

        titleLabel.text = card.title
        backgroundColor = .white
        layer.cornerRadius = 20
    }

    private func setupUI() {
        addSubview(titleLabel)
        addSubview(itemsContainer)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.70).isActive = true

        // TODO: Display pokemon info (eg. types, abilities)
        
        itemsContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin).isActive = true
        itemsContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        itemsContainer.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -margin).isActive = true
        itemsContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin).isActive = true
    }

}
