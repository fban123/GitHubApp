import UIKit
import SnapKit

extension SearchViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        octocatImageView = UIImageView()
        view.addSubview(octocatImageView)

        logoImageView = UIImageView()
        view.addSubview(logoImageView)

        searchBar = CustomSearchBar()
        view.addSubview(searchBar)

        sortContainerView = SortContainerView()
        view.addSubview(sortContainerView)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        collectionView.register(
            RepositoryCollectionViewCell.self,
            forCellWithReuseIdentifier: RepositoryCollectionViewCell.identifier)
        collectionView.delegate = self
        view.addSubview(collectionView)

        messageLabel = UILabel()
        collectionView.backgroundView = messageLabel

        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: view,
                action: #selector(UIView.endEditing(_:))))
    }
    
    func styleViews() {
        view.backgroundColor = .appWhite

        octocatImageView.image = UIImage(with: .octocat)

        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(with: .logo)

        searchBar.placeholder = LocalizableStrings.searchPlaceholder.localized

        collectionView.backgroundColor = .appWhite
        collectionView.backgroundView?.isHidden = true

        messageLabel.text = LocalizableStrings.backgroundMessage.localized
        messageLabel.textColor = .appBlack
        messageLabel.font = .boldSystemFont(ofSize: 24)
        messageLabel.textAlignment = .center
    }
    
    func defineLayoutForViews() {
        octocatImageView.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.size.equalTo(octocatImageViewSize)
        }

        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.leading.equalTo(octocatImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(64)
            $0.centerY.equalTo(octocatImageView)
            $0.height.equalTo(octocatImageViewSize.height)
        }

        searchBar.snp.makeConstraints {
            $0.top.equalTo(octocatImageView.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(searchBarInset)
        }

        sortContainerView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(12)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(sortContainerView.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

}

extension SearchViewController {

    private func makeLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(220))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(220))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8

        return UICollectionViewCompositionalLayout(section: section)
    }

}
