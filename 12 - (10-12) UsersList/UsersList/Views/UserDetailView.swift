//
//  UserDetailView.swift
//  UsersList
//
//  Created by hawkeyeshi on 7/30/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    @EnvironmentObject var users: Users
    
    var body: some View {
        List {
            HStack {
                Circle()
                    .fill(user.isActive ? Color.green : Color.red)
                    .frame(width: 15, height: 15)
                
                Text(user.name)
                    .font(.largeTitle)
            }
            .padding(.vertical)
            
            Section(header: Text("Information")) {
                VStack(alignment: .leading) {
                    Text("Age:")
                        .foregroundColor(.secondary)
                    Text("\(user.age)")
                }
                VStack(alignment: .leading) {
                    Text("Company:")
                        .foregroundColor(.secondary)
                    Text("\(user.company)")
                }
                VStack(alignment: .leading) {
                    Text("Email:")
                        .foregroundColor(.secondary)
                    Text("\(user.email)")
                }
                VStack(alignment: .leading) {
                    Text("Address:")
                        .foregroundColor(.secondary)
                    Text("\(user.address)")
                }
            }
            
            Section(header: Text("Friends")) {
                ForEach(user.friendsAsUsers(users: users.all), id: \.id) { friend in
                    NavigationLink(destination:
                        UserDetailView(user: friend)
                            .environmentObject(self.users)
                    ) {
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .font(.headline)
                            Text(friend.email)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .font(.callout)
        .navigationBarTitle(Text(user.name), displayMode: .inline)
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView()
//    }
//}
