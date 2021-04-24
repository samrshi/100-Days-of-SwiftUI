//
//  ContentView.swift
//  UsersList
//
//  Created by hawkeyeshi on 7/30/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var users: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.uwName)
                            .font(.headline)
                        Text(user.uwEmail)
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onAppear {
                if self.users.isEmpty {
                    Users.loadData(moc: self.moc)
                }
            }
            .navigationBarTitle("Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
