//
//  OnboardingView.swift
//  Onboarding
//
//  Created by ANDREY VORONTSOV on 03.03.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var currentPage: OnboardingPage = .welcome
    private var currentPageIndex: Int? {
        pages.firstIndex(of: currentPage)
    }
    private let pages: [OnboardingPage]
    private let completion: () -> Void
    
    private var isLastPage: Bool {
        guard
            let currentPageIndex,
            pages.count <= currentPageIndex + 1
        else {
            return false
        }
        return true
    }
    
    init(pages: [OnboardingPage], completion: @escaping () -> Void) {
        self.pages = pages
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            ForEach(pages, id: \.self) { page in
                if page == currentPage {
                    page.view(action: showNextPageIfPossible)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(AnyTransition.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading))
                        )
                        .animation(.default)
                }
            }
            
            if currentPage.shouldShowNextButton {
                button(title: "Next", action: showNextPageIfPossible)
            }
            if isLastPage {
                button(title: "Got it!", action: completion)
            }
        }
        .onAppear {
            self.currentPage = pages.first!
        }
    }
    
    private func showNextPageIfPossible() {
        guard let currentPageIndex, pages.count > currentPageIndex + 1 else {
            return
        }
        currentPage = pages[currentPageIndex + 1]
    }
    
    @ViewBuilder
    private func button(title: String, action: @escaping () -> Void) -> some View {
        HStack {
            Spacer()
            Button(action: action, label: {
                Text(title)
            })
        }
        .padding(EdgeInsets(top: 0, leading: 50, bottom: 50, trailing: 50))
        .transition(AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))
        )
        .animation(.default)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(pages: OnboardingPage.fullOnboarding, completion: {})
    }
}
