import WebKit
import UIKit
import Combine

class WebViewController: UIViewController {

    var webView: WKWebView!

    private var externalLink: String!

    convenience init(externalLink: String) {
        self.init()

        self.externalLink = externalLink
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        loadWebView()
    }

    private func loadWebView() {
        guard let url = URL(string: externalLink) else { return }

        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

}
