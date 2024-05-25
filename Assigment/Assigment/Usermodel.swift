//
//  Usermodel.swift
//  Assigment
//
//  Created by Apple on 25/05/24.
//

import Foundation

class UsermodelElement: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }

    init(userID: Int, id: Int, title: String, body: String) {
        self.userID = userID
        self.id = id
        self.title = title
        self.body = body
    }
}

typealias Usermodel = [UsermodelElement]
