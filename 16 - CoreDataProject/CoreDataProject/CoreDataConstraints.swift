//
//  CoreDataConstraints.swift
//  CoreDataProject
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct CoreDataConstraints: View {
    // CoreData allows us to add constraints to certain properties to ensure that they're unique (i.e. storing contacts based on the user's email address, you don't want many contacts with same email)
    
    // if you try to save when there are collisions with a constrained property, you need to add code in SceneDelegate
        // import CoreData and add "context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy" under let context...
        // now, if there are duplicates, it will stip out duplicats on save
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: self.moc)
                wizard.name = "Harry"
            }
            
            Button("Save") {
                do {
                    try self.moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct CoreDataConstraints_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataConstraints()
    }
}
