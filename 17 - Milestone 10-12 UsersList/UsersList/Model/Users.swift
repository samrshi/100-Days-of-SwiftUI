//
//  Users.swift
//  UsersList
//
//  Created by hawkeyeshi on 7/30/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

class Users: ObservableObject {
    @Published var all: [User] = [User]()
    
    init() {
        let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard (response as? HTTPURLResponse) != nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    
                    let result = try decoder.decode([User].self, from: data)
                    self.all = result.sorted()
                } catch let err {
                    print(err)
                }
            }
        }.resume()
    }
}
