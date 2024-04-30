//
//  PostData.swift
//  H4CK3R News
//
//  Created by Rohin Madhavan on 30/04/2024.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let objectID: String
    let title: String
    let url: String?
    let points : Int
    var id: String {
        return objectID
    }
}
