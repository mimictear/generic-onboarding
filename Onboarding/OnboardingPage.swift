//
//  OnboardingPage.swift
//  Onboarding
//
//  Created by ANDREY VORONTSOV on 03.03.2023.
//

import SwiftUI

enum OnboardingPage: CaseIterable {
    case welcome
    case newFeature
    case permissions
    case sales
    
    static let fullOnboarding = OnboardingPage.allCases
    
    var shouldShowNextButton: Bool {
        switch self {
        case .welcome, .newFeature: return true
        default: return false
        }
    }
    
    /// Factory method, which returns a specific view for each case. The method takes an action handler which can be executed on completion to go to the next page.
    @ViewBuilder
    func view(action: @escaping () -> Void) -> some View {
        switch self {
        case .welcome:
            Text("Welcome")
        case .newFeature:
            Text("See this new feature!")
        case .permissions:
            HStack {
                Text("We need some permissions")
                Button(action: action, label: {
                    Text("Continue")
                })
            }
        case .sales:
            Text("Become PRO for even more features")
        }
    }
}
