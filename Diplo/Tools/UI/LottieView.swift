//
//  LottieView.swift
//  Diplo
//
//  Created by Björn Waltert on 01.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

//import SwiftUI
//import Lottie
//
//struct LottieView: UIViewRepresentable {
//    let animationView = AnimationView()
//    var filename = "starblast"
//    
//    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
//        let view = UIView()
//        
//        let animation = Animation.named(filename)
//        animationView.animation = animation
//        animationView.contentMode = .scaleAspectFit
//        animationView.play()
//        
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(animationView)
//        
//        NSLayoutConstraint.activate([
//            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
//        ])
//        
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
//}
