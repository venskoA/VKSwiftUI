//
//  ConfigURLForVK.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation

final class ConfigURLGet {
    private let schema = "http"
    private let host = "api.vk.com"
    private let versionApi = "5.81"

    let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession.init(configuration: config)
        return session
    }()

    func configure(token: String,
                   method: TypeMetod,
                   httpMetod: TypeRequests,
                   param: [String: String]) -> URL {
        var queryItem = [URLQueryItem]()
        queryItem.append(URLQueryItem(name: "access_token", value: token))
        queryItem.append(URLQueryItem(name: "v", value: versionApi))

        for (param, value) in param {
            queryItem.append(URLQueryItem(name: param, value: value))
        }

        var urlConponent = URLComponents()
        urlConponent.scheme = schema
        urlConponent.host = host
        urlConponent.path = method.rawValue
        urlConponent.queryItems = queryItem

        guard let url = urlConponent.url else {
            fatalError("URL is invaled")
        }
        return url
    }
}
