//
//  OrdersView.swift
//  Diplo
//
//  Created by Björn Waltert on 03.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct OrdersView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAddOrderSheet: Bool = false
    
    var body: some View {
        Form {
            Section {
                Text("")
            }
        }
        .navigationBarTitle(Text("orders".localized().capitalizeFirstLetter()), displayMode: .large)
        .navigationBarItems(trailing:
            Button(action: {
                self.showAddOrderSheet.toggle()
            }) {
                Image(systemName: "plus")
                    .imageScale(.large)
                    .font(.headline)
                    .frame(width: 25, height: 25, alignment: .center)
            }
            .sheet(isPresented: self.$showAddOrderSheet) {
                AddOrderView()
            }
        )
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrdersView()
        }
    }
}
