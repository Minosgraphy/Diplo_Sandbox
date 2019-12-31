//
//  TopHeadlinesView.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct TopHeadlinesView : View {
    var topHeadlines: Articles
    
    var body: some View {
        PageView(topHeadlines.map { TopHeadlineRow(article: $0) })
    }
}

