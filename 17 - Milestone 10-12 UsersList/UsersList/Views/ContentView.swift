//
//  ContentView.swift
//  UsersList
//
//  Created by hawkeyeshi on 7/30/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var users = Users()
    
    var body: some View {
        NavigationView {
            List(users.all) { user in
                NavigationLink(destination: UserDetailView(user: user).environmentObject(self.users)) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
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
