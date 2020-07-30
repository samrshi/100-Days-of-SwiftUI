//
//  CoreData.swift
//  Bookworm
//
//  Created by hawkeyeshi on 7/11/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct CoreData: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
        
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(students, id: \.id) { student in
                        Text(student.name ?? "Unknown")
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            self.moc.delete(self.students[index])
                        }
                        
                        do {
                            try self.moc.save()
                        } catch {
                            print("error")
                        }
                    }
                }
            }
            .navigationBarItems(leading:
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(context: self.moc)
                    student.id = UUID()
                    student.name = "\(chosenFirstName) \(chosenLastName)"
                    
                    try? self.moc.save()
            }, trailing: EditButton())
        }
    }
}

//struct CoreData_Previews: PreviewProvider {
//    static var previews: some View {
//        CoreData()
//    }
//}
