//
//  NetworkManager.swift
//  H4CK3R News
//
//  Created by Rohin Madhavan on 30/04/2024.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else {
            return
        }
        
        let session  = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                let decorder = JSONDecoder()
                if let safeData = data {
                    do {
                        let results = try decorder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
}
