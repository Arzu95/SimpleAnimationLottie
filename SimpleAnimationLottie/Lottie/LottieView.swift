//
//  LottieView.swift
//  SimpleAnimationLottie
//
//  Created by Muhammad Arzu on 05/02/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let name: String
    let loopMode: LottieLoopMode
    
    init(name: String, loopMode: LottieLoopMode = .loop) {
        self.name = name
        self.loopMode = loopMode
    }
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let view = LottieAnimationView(name: name)
        
        view.loopMode = loopMode
        view.contentMode = .scaleAspectFit
        view.play()
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
   
}


struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView(name: "Animation - 1707124194011", loopMode: .loop)
    }
}
