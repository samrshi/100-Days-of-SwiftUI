//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by hawkeyeshi on 7/23/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import CoreData

// challenge 3
public enum Predicates: String {
    case beginsWith = "BEGINSWITH"
    case beginsWithIgnoreCase = "BEGINSWITH[C]"
    case contains = "CONTAINS"
    case containsIgnoreCase = "CONTAINS[C]"
    case equals = "=="
    case equalsIgnoreCase = "==[C]"
    case endsWith = "ENDSWITH"
    case endsWithIgnoreCase = "ENDSWITH[C]"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    
    let content: (T) -> Content
    
    var body: some View {
        List(singers, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, predicate: Predicates, sortDescriptors: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "@K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
