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
        NavigationStack {
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
                    HStack {
                        createNavigationLinkButton(destination: MapView(), imageName: "ClockPlus", buttonText: "Masuk", textColor: .white, buttonWidth: 166, buttonHeight: 40, buttonColor: Color(red: 168/255, green: 122/255, blue: 71/255))

                        createNavigationLinkButton(destination: DummyView(), imageName: "ClockCheck", buttonText: "Pulang", textColor: Color(red: 168/255, green: 122/255, blue: 71/255), buttonWidth: 166, buttonHeight: 40, buttonColor: .white)
                    }
    //                .padding(.top, -25)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.941, green: 0.941, blue: 0.941))
        }
    }
    
    
    @ViewBuilder
    func createNavigationLinkButton<Destination: View>(destination: Destination, imageName: String, buttonText: String, textColor: Color, buttonWidth: CGFloat, buttonHeight: CGFloat, buttonColor: Color) -> some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(imageName)
                    .frame(maxWidth: 24, maxHeight: 24)
                    .padding(.trailing, 2)
                
                Text(buttonText)
                    .foregroundStyle(textColor)
                    .font(.arkaFont)
            }
            .frame(maxWidth: buttonWidth, maxHeight: buttonHeight)
            .background(
                RoundedRectangle(cornerRadius: 80)
                    .foregroundStyle(buttonColor)
            )
        }
    }
}


