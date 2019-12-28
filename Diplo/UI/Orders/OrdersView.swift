//
//  OrdersView.swift
//  Diplo
//
//  Created by Björn Waltert on 27.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct OrdersView: View {
    var body: some View {
        HStack {
            Image(systemName: "list.bullet").imageScale(.large)
            Text("Orders")
                .font(.custom("Avenir Next", size: 28)).fontWeight(.regular)
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
