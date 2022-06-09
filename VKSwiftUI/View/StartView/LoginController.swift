//
//  LoginController.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation
import UIKit
import WebKit
import SwiftUI

struct LoginView: UIViewControllerRepresentable {
    @ObservedObject var vc = LoginControllerWK()
    @Binding var load: Bool 

    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        DispatchQueue.main.async {
            load = vc.vcLoad
        }
    }
}

class LoginControllerWK: UIViewController, ObservableObject {
    var loginWebView: WKWebView = {
        let web = WKWebView()
        return web
    }()

    @Published var vcLoad: Bool = false

    //    @Binding var cancelView: Bool = false

    var session = Session.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        loadAuth()
        loginWebView.navigationDelegate = self
    }
}

private extension LoginControllerWK {
    func createView() {
        loginWebView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginWebView)

        loginWebView.frame = view.bounds

        NSLayoutConstraint.activate([
            loginWebView.topAnchor.constraint(equalTo: view.topAnchor),
            loginWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func loadAuth() {
        var urlComponent = URLComponents()

        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"
        urlComponent.queryItems = [
            URLQueryItem(name: "client_id", value: "8047832"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline, friends, photos, groups, wall"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]

        let request = URLRequest(url: urlComponent.url!)
        loginWebView.load(request)
    }
}

extension LoginControllerWK: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }

        let param = fragment
            .components(separatedBy: "&")
            .map{ $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }

        if let token = param["access_token"], let userId = param["user_id"] {
            session.token = token
            session.userId = Int(userId)!
            print("token = ", token)
            print("userId = ", userId)
            decisionHandler(.cancel)
            vcLoad = true
            objectWillChange.send()
        }
    }
}

