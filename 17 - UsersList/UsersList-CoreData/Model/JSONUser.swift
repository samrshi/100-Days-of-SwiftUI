//
//  User.swift
//  UsersList
//
//  Created by hawkeyeshi on 7/30/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct JSONUser: Identifiable, Codable {
    var id: String
    
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    
    var registered: String
    var tags: [String]
    
    var friends: [JSONFriend]
}
