//
//  WebView.swift
//  ArkaOne
//
//  Created by tandyys on 19/02/25.
//

import SwiftUI
@preconcurrency import WebKit

struct WebView: UIViewRepresentable {
    @Binding var isLoading: Bool
    @Binding var isLoggedIn: Bool
    let url: URL
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.scrollView.isScrollEnabled = true
        return webView
    }
    
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("halaman sedang dimuat")
            
            DispatchQueue.main.async {
                self.parent.isLoading = true
            }
        }
        
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("halaman selesai dimuat")
            
            DispatchQueue.main.async {
                self.parent.isLoading = false
            }
            
            guard let currentURL = webView.url else {
                print("URL not found")
                return
            }
            
            if (currentURL.absoluteString == "https://corporate.arkagroup.id/login/") {
                DispatchQueue.main.async {
                    self.parent.isLoggedIn = false
                }
            }
            if (currentURL.absoluteString == "https://corporate.arkagroup.id/index.108") {
                DispatchQueue.main.async {
                    self.parent.isLoggedIn = true
                }
            }
        }
    }
}
