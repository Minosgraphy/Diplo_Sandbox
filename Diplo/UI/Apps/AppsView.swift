//
//  AppsView.swift
//  Diplo
//
//  Created by Björn Waltert on 04.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct AppsView: View {
    var body: some View {
        Form {
            Section {
                Group {
                    Text("")
                }
                .listRowBackground(Color("MainBackgroundColorListRow"))
                .listRowInsets(EdgeInsets(top: 0,
                                          leading: 10,
                                          bottom: 0,
                                          trailing: 10))
            }
        }
        .navigationBarTitle(Text("Apps"), displayMode: .inline)
    }
}

struct AppsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppsView()
        }
    }
}
