//
//  ContentView.swift
//  ArkaOne
//
//  Created by tandyys on 19/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var isLoading = false
    @State var isLoggedIn = false
    private let url = URL(string: "https://corporate.arkagroup.id")
    
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    Color(red: 0.941, green: 0.941, blue: 0.941)
                }
                .ignoresSafeArea(.all)
                
                ZStack {
                    WebView(isLoading: $isLoading, isLoggedIn: $isLoggedIn, url: url!)
                }
                
                DefaultLoadingView(isLoading: $isLoading)
            }
            
            if(isLoggedIn) {
                Text("Absence Button Showed")
                    .frame(maxWidth: .infinity, maxHeight: 84)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.green)
                    .background(Color(red: 0.941, green: 0.941, blue: 0.941))
                    .ignoresSafeArea(.all)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
