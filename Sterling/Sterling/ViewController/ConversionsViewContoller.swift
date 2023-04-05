//
//  ViewController.swift
//  Sterling
//
//  Created by Owen Henley on 23/03/2023.
//

import UIKit

class ConversionsViewContoller: UICollectionViewController {

    private var fetchData = FetchData()
    private var conversionRates = [String: Double]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getConversionRates(for: .gbp)
        setupCollectionView()
    }

    // MARK: - Setup CollectionView

    private func setupCollectionView() {
        collectionView.collectionViewLayout = layout()

        let currencyCodes = conversionRates.map { $0.key }
        let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = currencyCodes[indexPath.row]
            cell.contentConfiguration = contentConfiguration
        }

        let dataSource = UICollectionViewDiffableDataSource<Int, String>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }

        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(currencyCodes)
        dataSource.apply(snapshot)
    }

    private func layout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

    // MARK: - Methods

    private func getConversionRates(for currency: CurrencyCode = CurrencyCode.gbp) {
        Task {
            do {
                conversionRates = try await fetchData.latestCurrencyData(for: currency).conversionRates
                print(conversionRates)
            } catch {
                print(FetchError.failed(error))
            }
        }
    }
}
