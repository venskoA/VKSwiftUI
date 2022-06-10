//
//  FriendsApiService.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation

final class FriendsApiService {
    private let getUrl = ConfigURLGet()

    func loadFriends(completion: @escaping ((Result<FriendsVK, AllError>) -> ())) {
        guard let token = Session.shared.token else {return}
        let param: [String: String] = ["fields": "photo_200_orig",
                                       "order": "name"]

        let url = getUrl.configure(token: token,
                                   method: .friendGet,
                                   httpMetod: .get,
                                   param: param)
        print("Friends url = \(url)")
        let task = getUrl.session.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.requestError(error)))
            }

            guard let data = data else { return }
            let decoder = JSONDecoder()

            do {
                let result = try decoder.decode(FriendsVK.self, from: data)
                return completion(.success(result))
            } catch {
                return completion(.failure(.parseError))
            }
        }
        task.resume()
    }
}
