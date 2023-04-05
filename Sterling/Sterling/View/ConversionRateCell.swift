//
//  ConversionRateCell.swift
//  Sterling
//
//  Created by Owen Henley on 29/03/2023.
//

import UIKit

class ConversionRateCell: UICollectionViewListCell {

    @IBOutlet var currencyLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.text = "USD"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    @IBOutlet var conversionRateLabel: UILabel! = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "1.194567"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    @IBOutlet var stackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews(){
        backgroundColor = .white

        addSubview(currencyLabel)
        addSubview(conversionRateLabel)
        addSubview(stackView)

        stackView.addArrangedSubview(currencyLabel)
        stackView.addArrangedSubview(conversionRateLabel)

        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        stackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
    }
}
