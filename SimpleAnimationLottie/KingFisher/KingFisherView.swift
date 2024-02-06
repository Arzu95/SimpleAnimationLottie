//
//  KingFisherView.swift
//  SimpleAnimationLottie
//
//  Created by Muhammad Arzu on 05/02/24.
//

import SwiftUI
import Kingfisher

struct KingFisherView: View {
    
    let imageURL: URL
    
    var body: some View {
        KFImage(imageURL)
        
    }
}

struct KingFisherView_Previews: PreviewProvider {
    static var previews: some View {
        KingFisherView(imageURL: URL(string: "https://i.pinimg.com/564x/e8/5a/41/e85a414cd2ce6d36a842a3334aa57107.jpg")!)
    }
}
