//
//  AnotherViewLottie.swift
//  SimpleAnimationLottie
//
//  Created by Muhammad Arzu on 05/02/24.
//

import SwiftUI

struct AnotherViewLottie: View {
    
    @State var score = 0
    
    var body: some View {
        ZStack{
            VStack(spacing: 32){
                Text("Score \(score)")
                    .font(.title)
                
                Button("Submit"){
                    if score < 5 {
                        score += 1
                       
                    } else{
                        score = 0
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            if score == 5 {
                LottieView(name: "Animation-1707103135893")
            }
        }
    }
}

struct AnotherViewLottie_Previews: PreviewProvider {
    static var previews: some View {
        AnotherViewLottie()
    }
}
