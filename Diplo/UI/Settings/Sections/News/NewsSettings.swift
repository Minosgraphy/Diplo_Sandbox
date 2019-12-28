//
//  NewsSettings.swift
//  Diplo
//
//  Created by Björn Waltert on 27.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct NewsSettings: View {
    var body: some View {
        Form {
            NavigationLink(destination: SearchForArticlesView()) {
                Text("Artikel suchen")
            }
        }
        .navigationBarTitle("News", displayMode: .inline)
    }
}

struct NewsSettings_Previews: PreviewProvider {
    static var previews: some View {
        NewsSettings()
    }
}
