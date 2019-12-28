//
//  OrdersSettings.swift
//  Diplo
//
//  Created by Björn Waltert on 28.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct OrdersSettings: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: self.$isActive) {
                    HStack {
                        Image(systemName: "list.bullet")
                        Text("Orders Toggle")
                            .font(.custom("Avenir Next", size: 21)).fontWeight(.regular)
                    }
                }
            }
            
            HStack {
                Image(systemName: "list.bullet")
                Text("Orders Setting 1")
                    .font(.custom("Avenir Next", size: 21)).fontWeight(.regular)
            }
            
            HStack {
                Image(systemName: "list.bullet")
                Text("Orders Setting 2")
                    .font(.custom("Avenir Next", size: 21)).fontWeight(.regular)
            }
            
            HStack {
                Image(systemName: "list.bullet")
                Text("Orders Setting 3")
                    .font(.custom("Avenir Next", size: 21)).fontWeight(.regular)
            }
        }
        .navigationBarTitle("Orders", displayMode: .inline)
    }
}

struct OrdersSettings_Previews: PreviewProvider {
    static var previews: some View {
        OrdersSettings()
    }
}
