//
//  SafariView.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI
import SafariServices

struct SafariView : UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariView = SFSafariViewController(url: url)
        safariView.preferredControlTintColor = UIColor.systemBlue
        return safariView
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
