//
//  DefaultLoadingView.swift
//  ArkaOne
//
//  Created by tandyys on 20/02/25.
//

import SwiftUI

struct DefaultLoadingView: UIViewRepresentable {
    @Binding var isLoading: Bool
    
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let loadingView = UIActivityIndicatorView(style: .large)
        loadingView.color = .black
        loadingView.layer.cornerRadius = 10
        loadingView.backgroundColor = .clear
        loadingView.clipsToBounds = true
        return loadingView
    }
    
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isLoading {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
