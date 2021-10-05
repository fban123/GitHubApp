import UIKit
import SnapKit
import WebKit

extension WebViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        webView = WKWebView()
        view.addSubview(webView)
    }

    func styleViews() {
    }

    func defineLayoutForViews() {
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
