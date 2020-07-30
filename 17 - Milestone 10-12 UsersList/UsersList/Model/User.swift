//
//  User.swift
//  UsersList
//
//  Created by hawkeyeshi on 7/30/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct User: Identifiable, Codable, Comparable {
    var id: String
    var isActive: Bool
    
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    
    var registered: String
    var tags: [String]
    
    var friends: [Friend]
    
    func friendsAsUsers(users: [User]) -> [User] {
        var result = [User]()
        
        for friend in friends {
            if let found = users.first(where: {
                $0.id == friend.id
            }) {
                result.append(found)
            }
        }
        
        return result
    }
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}
