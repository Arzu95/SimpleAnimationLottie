//
//  SimpleAnimationLottieApp.swift
//  SimpleAnimationLottie
//
//  Created by Muhammad Arzu on 05/02/24.
//

import SwiftUI

@main
struct SimpleAnimationLottieApp: App {
    var body: some Scene {
        WindowGroup {
            
            OnBoardingPage()
            LottieView(name: "anjay-slebew", loopMode: .loop)
        }
    }
}
