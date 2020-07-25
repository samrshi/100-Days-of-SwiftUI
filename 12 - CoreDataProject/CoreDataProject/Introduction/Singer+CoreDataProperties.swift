//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by hawkeyeshi on 7/23/20.
//  Copyright © 2020 samrshi. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    var wrappedlastName: String {
        lastName ?? "Unknown"
    }

}
