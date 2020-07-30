//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    // you *can* remove optionals, but you can still create an instance of this class without instantiating them
        // this is because these aren't *real* properties
    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    // safer way is to add computed properties to the class to unwrap the optionals so that the rest of your code doesn't have to deal with optionality
    public var wrappedTitle: String {
        title ?? "Unknown title"
    }

}
