//
//  ValidatingForms.swift
//  Cupcake Corner
//
//  Created by hawkeyeshi on 7/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ValidatingForms: View {
    @State var username = ""
    @State var email = ""
    
    var disabledForm : Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Username", text: $email)
            }
            .disabled(disabledForm)
            
            Section {
                Button("Create Account") {
                    print("Creating account...")
                }
            }
        }
    }
}

struct ValidatingForms_Previews: PreviewProvider {
    static var previews: some View {
        ValidatingForms()
    }
}
