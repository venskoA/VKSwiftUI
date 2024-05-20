//
//  GroupApiService.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 5.06.22.
//

import Foundation
import RealmSwift

enum GroupError: Error {
    case parseError(String)
    case requestError(String)
}

final class GroupApiService: Operation {

    private let config = ConfigURLGet()
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession.init(configuration: config)
        return session
    }()

    private var realm = RealmCacheService()
    private let cacheKey = "groups"
    private let decoder = JSONDecoder()

    func loadGroup(completion: @escaping ((Result<[GroupItems], AllError>) -> ())) {
        if checkExpiry(key: cacheKey) {
            guard let realm = try? Realm() else { return }
            let groups = realm.objects(GroupItems.self)
            let groupsArray = Array(groups)

            if !groups.isEmpty {
                completion(.success(groupsArray))
                return
            }
        }

        guard let token = Session.shared.token else {return}
        let param: [String: String] = ["extended": "1"]

        let url = config.configure(token: token,
                                   method: .groupGet,
                                   httpMetod: .get,
                                   param: param)

        print("Group url = \(url)")

        let task = session.dataTask(with: url) {[weak self] data, response, error in
            guard let self = self else { return }
            if let error = error {
                return completion(.failure(.requestError(error)))
            }

            guard let data = data else { return }

            do {
                //                let result = try decoder.decode(GroupVK.self, from: data)
                let result = try self.decoder.decode(GroupVK.self, from: data).response.items

                DispatchQueue.main.async {
                    self.realm.create(result)
                }

//                self.setExpiry(key: self.cacheKey, time: 1 * 6)
                return completion(.success(result))
            } catch {
                print("Load error = \(error)")
                return completion(.failure( .parseError ))
            }
        }
        task.resume()
    }

    func loadGroupSearch(searchText text: String, comletion: @escaping(Result<[GroupItems], GroupError>) -> Void ) {
        guard let token = Session.shared.token else { return }
        let param: [String: String] = ["q": text,
                                       "count": "20",
                                       "type": "group"]
        let url = config.configure(token: token,
                                   method: .groupGet,
                                   httpMetod: .get,
                                   param: param)
        print("URL loadSearch = \(url)")
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                return comletion(.failure(.requestError("\(error)")))
            }
            guard let data = data else { return }
            do {
                let result = try self.decoder.decode(GroupVK.self, from: data)
                return comletion(.success(result.response.items))
            } catch {
                return comletion(.failure(.parseError("group parseError")))
            }
        }
        task.resume()
    }

    func addGroup(idGroup: Int, completion: @escaping((Result<GroupVKJoin, GroupError>) -> Void)) {
        guard let token = Session.shared.token else { return }
        let param: [String: String] = ["group_id": "\(idGroup)"]
        let url = config.configure(token: token,
                                   method: .groupsJoin,
                                   httpMetod: .get,
                                   param: param)
        print("Add allGroup = \(url)")

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.requestError("\(error)")))
            }
            guard let data = data else { return }
            do {
                let result = try self.decoder.decode(GroupVKJoin.self, from: data)
                return completion(.success(result))
            } catch {
                return completion(.failure(.parseError("Join group parseError")))
            }
        }
        task.resume()
    }

    func deleteGroup(idGroup: Int, completion: @escaping(Result<GroupVKJoin, GroupError>) -> Void) {
        guard let token = Session.shared.token else { return }
        let param: [String: String] = ["group_id": "\(idGroup)"]
        let url = config.configure(token: token,
                                   method: .groupsLeave,
                                   httpMetod: .get,
                                   param: param)
        print("Delet allGroup = \(url)")

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.requestError("\(error)")))
            }
            guard let data = data else { return }
            do {
                let result = try self.decoder.decode(GroupVKJoin.self, from: data)
                return completion(.success(result))
            } catch {
                return completion(.failure(.parseError("Leave group parseError")))
            }
        }
        task.resume()
    }
}

private extension GroupApiService {
    /// Записывает дату просрочки кэша
    func setExpiry(key: String, time: Double) {
        let date = (Date.init() + time).timeIntervalSince1970
        UserDefaults.standard.set(String(date), forKey: key)
    }

    /// Проверяет, свежие ли данные, true - всё хорошо
    func checkExpiry(key: String) -> Bool {
        let expiryDate = UserDefaults.standard.string(forKey: key) ?? "0"
        let currentDate = String(Date.init().timeIntervalSince1970)

        if expiryDate > currentDate {
            return true
        } else {
            return false
        }
    }
}
