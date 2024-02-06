//
//  OnBoardingPage.swift
//  SimpleAnimationLottie
//
//  Created by Muhammad Arzu on 06/02/24.
//

import SwiftUI
import Kingfisher


let customFont = "realeway-regular"

struct OnBoardingPage: View {
    
    @State var showLoginPage: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Find your\nGadget")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(.white)
//            Image("OnBoard")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
            
            KFImage(URL(string: "https://i.pinimg.com/564x/0d/d0/a9/0dd0a987c1bffc799958b813b3367ab8.jpg")!)
                .resizable()
                .scaledToFit()
            
            
                        
            
            Button{
                withAnimation{
                    showLoginPage = true
                }
            } label: {
                Text("Get Started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal,30)
            .offset(y: getRect().height < 750 ? 20 : 40)
            
            Spacer()
        }
        .padding()
        .padding(.top,getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("Purple")
        )
        .overlay {
            if showLoginPage{
                LoginPage()
                    .transition(.move(edge: .bottom))
            }
        }
        
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
