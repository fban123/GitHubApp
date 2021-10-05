import UIKit
import SnapKit

extension IconsContainerView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        forkView = LabelIconView()
        addSubview(forkView)

        watchersView = LabelIconView()
        addSubview(watchersView)
    }

    func styleViews() {
    }

    func defineLayoutForViews() {
        forkView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }

        watchersView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(forkView.snp.trailing).offset(8)
        }
    }

}
