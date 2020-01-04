//
//  AddOrderView.swift
//  Diplo
//
//  Created by Björn Waltert on 04.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var givenName: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Group {
                        TextField("Vorname", text: self.$givenName)
                    }
                }
            }
            .navigationBarTitle(Text("create".localized().capitalizeFirstLetter()), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("done".localized().capitalizeFirstLetter())
                }
            )
        }
    }
}

struct AddCitizenView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView()
    }
}
