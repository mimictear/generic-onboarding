//
//  ContentView.swift
//  Onboarding
//
//  Created by ANDREY VORONTSOV on 03.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isUserOnboarded") var isUserOnboarded = false
    
    var body: some View {
        if isUserOnboarded {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        } else {
            OnboardingView(pages: OnboardingPage.fullOnboarding) { isUserOnboarded = true }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
