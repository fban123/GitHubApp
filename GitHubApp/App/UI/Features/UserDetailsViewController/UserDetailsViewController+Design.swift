import UIKit
import SnapKit

extension UserDetailsViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)

        contentView = UIView()
        scrollView.addSubview(contentView)

        firstStackView = UIStackView()
        contentView.addSubview(firstStackView)

        createdLabel = UILabel()
        firstStackView.addArrangedSubview(createdLabel)

        updatedLabel = UILabel()
        firstStackView.addArrangedSubview(updatedLabel)

        firstSeparator = SeparatorContainerView()
        firstStackView.addArrangedSubview(firstSeparator)

        let containerView = UIView()
        avatarImageView = UIImageView()
        containerView.addSubview(avatarImageView)
        firstStackView.addArrangedSubview(containerView)

        nameLabel = UILabel()
        firstStackView.addArrangedSubview(nameLabel)

        usernameLabel = UILabel()
        firstStackView.addArrangedSubview(usernameLabel)

        secondSeparator = SeparatorContainerView()
        firstStackView.addArrangedSubview(secondSeparator)

        bioLabel = UILabel()
        firstStackView.addArrangedSubview(bioLabel)

        userReposTitle = UILabel()
        firstStackView.addArrangedSubview(userReposTitle)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        collectionView.register(
            UserRepositoryCollectionViewCell.self,
            forCellWithReuseIdentifier: UserRepositoryCollectionViewCell.identifier)
        collectionView.delegate = self
        contentView.addSubview(collectionView)

        secondStackView = UIStackView()
        contentView.addSubview(secondStackView)

        thirdSeparator = SeparatorContainerView()
        secondStackView.addArrangedSubview(thirdSeparator)

        locationView = IconLabelView()
        secondStackView.addArrangedSubview(locationView)

        emailView = IconLabelView()
        secondStackView.addArrangedSubview(emailView)
    }

    func styleViews() {
        view.backgroundColor = .appWhite

        firstStackView.axis = .vertical
        firstStackView.spacing = 16

        createdLabel.textColor = .appBlack
        createdLabel.textAlignment = .right
        createdLabel.font = UIFont.italicSystemFont(ofSize: 12)

        updatedLabel.textColor = .appBlack
        updatedLabel.textAlignment = .right
        updatedLabel.font = UIFont.italicSystemFont(ofSize: 12)

        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.roundAllCorners(withRadius: imageViewSize.height / 2)

        nameLabel.textColor = .appBlack
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.2

        usernameLabel.textColor = .appOrange
        usernameLabel.textAlignment = .center
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        usernameLabel.adjustsFontSizeToFitWidth = true
        usernameLabel.minimumScaleFactor = 0.2
        usernameLabel.isUserInteractionEnabled = true

        bioLabel.textColor = .appBlack.withAlphaComponent(0.7)
        bioLabel.numberOfLines = 0
        bioLabel.textAlignment = .left

        userReposTitle.textColor = .appBlack
        userReposTitle.textAlignment = .left
        userReposTitle.font = UIFont.boldSystemFont(ofSize: 12)

        collectionView.backgroundColor = .appWhite
        collectionView.isScrollEnabled = false

        secondStackView.axis = .vertical
        secondStackView.spacing = 8

        locationView.label.textColor = .appBlack
        locationView.label.textAlignment = .left
        locationView.label.font = UIFont.boldSystemFont(ofSize: 12)
        locationView.label.numberOfLines = 0

        emailView.label.textColor = .appBlack
        emailView.label.textAlignment = .left
        emailView.label.font = UIFont.boldSystemFont(ofSize: 12)
    }

    func defineLayoutForViews() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.width.equalTo(view)
            $0.edges.equalToSuperview()
        }

        firstStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        avatarImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(imageViewSize)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(firstStackView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(140)
        }

        secondStackView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
    }

}

extension UserDetailsViewController {

    private func makeLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(215),
            heightDimension: .estimated(140))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(215),
            heightDimension: .estimated(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = CGFloat(14)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
        section.orthogonalScrollingBehavior = .continuous

        return UICollectionViewCompositionalLayout(section: section)
    }

}
