//
//  ConditionalMOCSaving.swift
//  CoreDataProject
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ConditionalMOCSaving: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            // Apple says we should only try to save if there have been changes made to the managedObjectContext, and it has a .hasChanges property to tell us if it does
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        }
    }
}

struct ConditionalMOCSaving_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalMOCSaving()
    }
}
