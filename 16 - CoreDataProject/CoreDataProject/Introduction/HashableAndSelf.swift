//
//  ContentView.swift
//  CoreDataProject
//
//  Created by hawkeyeshi on 7/16/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct HashableAndSelf: View {
    let students: [Student] = [Student(name: "Harry"), Student(name: "Hermione")]
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct HashableAndSelf_Previews: PreviewProvider {
    static var previews: some View {
        HashableAndSelf()
    }
}
