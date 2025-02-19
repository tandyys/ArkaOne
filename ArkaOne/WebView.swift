//
//  WebView.swift
//  ArkaGroupSwiftUI
//
//  Created by tandyys on 19/02/25.
//

import SwiftUI
@preconcurrency import WebKit

struct WebView: UIViewRepresentable {
    @Binding var isLoggedIn: Bool
    let url: URL
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.scrollView.isScrollEnabled = true
        webView.load(request)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView,
                    decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url else {
                print("Something went wrong with the URL.")
                return
            }
            
            if (url.scheme == "https" && url.host == "corporate.arkagroup.id" && url.path == "/index.108") {
                DispatchQueue.main.async {
                    self.parent.isLoggedIn = true
                }
                decisionHandler(.allow)
                return
            }
            if(url.scheme == "https" && url.host == "corporate.arkagroup.id" && url.path == "/login"){
                DispatchQueue.main.async {
                    self.parent.isLoggedIn = false
                }
                decisionHandler(.allow)
                return
            }
            
            decisionHandler(.allow)
        }
    }
}
