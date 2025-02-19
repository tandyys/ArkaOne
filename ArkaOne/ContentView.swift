//
//  ContentView.swift
//  ArkaGroupSwiftUI
//
//  Created by tandyys on 19/02/25.
//

import SwiftUI

struct ContentView: View {
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
                    WebView(isLoggedIn: $isLoggedIn, url: url!)
                }
            }
            if(isLoggedIn) {
                Text("Muncul button absennya...")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.green)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
