import UIKit

class IconsContainerView: UIView {

    var forkView: LabelIconView!
    var watchersView: LabelIconView!

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(forks: Int, watchers: Int) {
        forkView.setData(with: forks, image: .fork)
        watchersView.setData(with: watchers, image: .watchers)
    }

}
