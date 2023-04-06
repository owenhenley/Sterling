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
        getCurrencyData(for: .gbp)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.collectionViewLayout = layout
        setupDataSource()
    }

    // MARK: Methods

    private func getCurrencyData(for currency: CurrencyCode = CurrencyCode.gbp) {
        Task {
            do {
                self.currency = try await fetchData.latestCurrencyData(for: currency)
                print(self.currency!)
            } catch {
                print(FetchError.failed(error))
            }
        }
    }
}

// MARK: - DataSource

extension ConversionsViewContoller {
    enum Section {
        case main
    }

    private func setupDataSource() {
//        guard let currency else { return }

//        let currencyCodes = currency.conversionRates.map { $0.key }
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { cell, indexPath, item in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = "\(item)"//currencyCodes[indexPath.row]
            cell.contentConfiguration = contentConfiguration
        }

        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }

        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0...100))
        dataSource.apply(snapshot)
    }
}
