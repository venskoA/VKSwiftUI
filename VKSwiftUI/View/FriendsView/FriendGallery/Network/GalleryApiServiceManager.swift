//
//  GalleryServiceManager.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation

final class GalleryApiServiceManager {
    private let getUrl = ConfigURLGet()

    func loadPhoto(idPerson: String, completion: @escaping ((Result<[PhotoItems], AllError>) -> ())) {
        guard let token = Session.shared.token else {return}
        let idPersonFriend = idPerson
        let param: [String: String] = ["count": "200",
                                       "extended": "1",
                                       "owner_id": idPersonFriend]

        let url = getUrl.configure(token: token,
                                   method: .photosGetAll,
                                   httpMetod: .get,
                                   param: param)
        print("FriendsPhoto url = \(url)")

        let task = getUrl.session.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.requestError(error)))
            }

            guard let data = data else { return }
            let decoder = JSONDecoder()

            do {
                let result = try decoder.decode(PhotoUserModel.self, from: data)
                return completion(.success(result.response.items))
            } catch {
                return completion(.failure(.parseError))
            }
        }
        task.resume()
    }
}

