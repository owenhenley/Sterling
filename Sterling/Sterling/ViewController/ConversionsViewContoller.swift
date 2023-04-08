//
//  ViewController.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//

import UIKit

class ConversionsViewContoller: UICollectionViewController {

    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil

    private var fetchData = FetchData()
    private var currency: Currency?

    private var layout: UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List"
        setupDataSource()
        collectionView.collectionViewLayout = layout
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        getCurrencyData(for: .gbp)
    }

    // MARK: Methods

    private func getCurrencyData(for currency: CurrencyCode = CurrencyCode.gbp) {
        Task {
            do {
                let latestData = try await fetchData.latestCurrencyData(for: currency)
                self.currency = latestData
//                updateSnapshot(with: latestData)
                print(self.currency!)
            } catch {
                print(FetchError.failed(error))
            }
        }
    }

//    private func updateSnapshot(with currency: Currency) {
//        guard let dataSource else { return }
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Currency>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems([currency])
//        dataSource.apply(snapshot)
//    }
}

// MARK: - DataSource

extension ConversionsViewContoller {
    enum Section {
        case main
    }

    private func setupDataSource() {
//        guard let currency else { return }

//        let currencyCodes = currency.conversionRates.map { $0.key }
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { cell, indexPath, currency in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = "\(currency)"
            cell.contentConfiguration = contentConfiguration
        }

        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, currency: Int) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: currency)
        }

        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<94))
        dataSource.apply(snapshot)
    }
}
