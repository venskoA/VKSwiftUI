//
//  ProcessingData.swift
//  courseTwoOne
//
//  Created by Andrey Vensko on 15.03.22.
//

import Foundation

class ProcessingData: AsyncOperation {

    init(text: String){
        self.text = text
    }

    private var text: String
    private let config = ConfigURLGet()
    var dataAll = [GroupItems]()
    let decoder = JSONDecoder()

    override func main() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            guard let token = Session.shared.token else { return }
            let param: [String: String] = ["q": self.text,
                                           "count": "20",
                                           "type": "group"]
            let url = self.config.configure(token: token,
                                method: .groupsSearch,
                                httpMetod: .get,
                                param: param)
            let task = self.config.session.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                do {
                    let result = try self.decoder.decode(GroupVK.self, from: data)
                    self.dataAll = result.response.items
                } catch {
                    return
                }
                self.state = .finished
            }
            task.resume()
        }
    }
}
