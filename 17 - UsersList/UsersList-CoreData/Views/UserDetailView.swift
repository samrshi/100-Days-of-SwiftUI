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
    
    var body: some View {
        List {
            Section(header: Text("Information")) {
                VStack(alignment: .leading) {
                    Text("Age:")
                        .foregroundColor(.secondary)
                    Text("\(user.uwAge)")
                }
                VStack(alignment: .leading) {
                    Text("Company:")
                        .foregroundColor(.secondary)
                    Text("\(user.uwCompanyName)")
                }
                VStack(alignment: .leading) {
                    Text("Email:")
                        .foregroundColor(.secondary)
                    Text("\(user.uwEmail)")
                }
                VStack(alignment: .leading) {
                    Text("Address:")
                        .foregroundColor(.secondary)
                    Text("\(user.uwAddress)")
                }
            }
            
            Section(header: Text("Friends")) {
                ForEach(user.friendsArray, id: \.id) { friend in
                    NavigationLink(destination:
                        UserDetailView(user: friend)
                    ) {
                        VStack(alignment: .leading) {
                            Text(friend.uwName)
                                .font(.headline)
                            Text(friend.uwEmail)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .font(.callout)
        .navigationBarTitle(Text(user.uwName))
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView()
//    }
//}
