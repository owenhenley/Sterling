//
//  ViewController.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//

import UIKit

class ConversionsViewContoller: UICollectionViewController {

    var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil

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
        getCurrencyData(for: .gbp)
    }

    // MARK: Methods

    private func getCurrencyData(for currency: CurrencyCode = CurrencyCode.gbp) {
        Task {
            do {
                let latestData = try await fetchData.latestCurrencyData(for: currency)
                self.currency = latestData
                updateSnapshot(with: latestData)
                print(self.currency!)
            } catch {
                print(FetchError.failed(error))
            }
        }
    }

    private func updateSnapshot(with currency: Currency) {
        let item = Item(currency: currency)
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems([item])
        dataSource.apply(snapshot)
    }
}

// MARK: - DataSource

extension ConversionsViewContoller {
    enum Section {
        case main
    }

    private func setupDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, indexPath, item in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = item.conversionRateCountryCode
            cell.contentConfiguration = contentConfiguration
        }

        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, currency: Item) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: currency)
        }

        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
//        snapshot.appendItems(
        dataSource.apply(snapshot)
    }
}
