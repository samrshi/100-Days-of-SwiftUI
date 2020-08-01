//
//  User+CoreDataProperties.swift
//  UsersList-CoreData
//
//  Created by hawkeyeshi on 8/1/20.
//  Copyright © 2020 samrshi. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var friends: NSSet?

    public var uwName: String {
        name ?? "Unknown name"
    }

    public var uwEmail: String {
        email ?? "Unknown email"
    }

    public var uwAddress: String {
        address ?? "Unknown address"
    }
    
    public var uwCompanyName: String {
        company ?? "Unkown company"
    }
    
    public var uwAge: String {
        String(age)
    }

    public var friendsArray: [User] {
        let set = friends as? Set<User> ?? []

        return set.sorted { $0.uwName < $1.uwName }
    }
}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: User)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: User)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
