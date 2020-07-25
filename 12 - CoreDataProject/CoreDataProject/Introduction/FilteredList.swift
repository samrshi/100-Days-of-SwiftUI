//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by hawkeyeshi on 7/23/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import CoreData

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
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "@K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
