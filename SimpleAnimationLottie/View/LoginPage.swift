//
//  LoginPage.swift
//  SimpleAnimationLottie
//
//  Created by Muhammad Arzu on 06/02/24.
//

import SwiftUI
import Lottie

struct LoginPage: View {
    
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Welcome\nback")
                    .fontWeight(.bold)
                    .font(.system(size: 55))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: getRect().height / 3.5)
                    .padding()
                    .background(
                        ZStack{
                            LinearGradient(colors: [
                            Color("LoginCircle"),
                            Color("LoginCircle").opacity(0.8),
                            Color("Purple")
                            ], startPoint: .top, endPoint: .bottom)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(.trailing)
                                .offset(y: -25)
                                .ignoresSafeArea()
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width: 30, height: 30)
                                .blur(radius: 3)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding(30)
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width: 23, height: 23)
                                .blur(radius: 2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.leading,30)
                        }
                    )
                
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 15){
                        Text(loginData.registerUser ? "Register" : "Login")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        CustomTextField(icon: "envelope", title: "Email", hint: "muhammadarzu3432@gmail.com", value: $loginData.email, showPassword:
                            .constant(false))
                            .padding(.top, 30)
                        
                        CustomTextField(icon: "lock", title: "Password", hint: "123", value: $loginData.password, showPassword: $loginData.showPassword)
                            .padding(.top, 10)
                        
                        if loginData.registerUser{
                            CustomTextField(icon: "envelope", title: "Re-Enter Password", hint: "123456", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                                .padding(.top, 10)
                        }
                        NavigationLink(destination: LottieView(name: "Animation - 1707124194011")) {
                            Button{
                                if loginData.registerUser{
                                    loginData.Register()
                                }
                                else{
                                    loginData.Login()
                                }
                                
                            } label: {
                                Text("Login")
                                    .fontWeight(.medium)
                                    .padding(.vertical,20)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .background(Color("Purple"))
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                            }
                            .padding(.top,25)
                            .padding(.horizontal)
                        }
                        
                        
                        
                        Button{
                            withAnimation{
                                loginData.registerUser.toggle()
                            }
                        } label: {
                            Text(loginData.registerUser ? "Back To Login" : "Create Account")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Purple"))
                        }
                        .padding(.top,8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color.white
                        .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                        .ignoresSafeArea()
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Purple"))
            
            .onChange(of: loginData.registerUser){ newValue in
                loginData.email = ""
                loginData.password = ""
                loginData.re_Enter_Password = ""
                loginData.showPassword = false
                loginData.showReEnterPassword = false
        }
        
        }
    }
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>,showPassword:Binding<Bool>)->some View{
        VStack(alignment: .leading, spacing: 12){
            Label{
                Text(title)
                    .fontWeight(.medium)
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") &&
                !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top,2)
            }
            else{
                TextField(hint, text: value)
                    .padding(.top,2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        .overlay(
            
            Group{
                if title.contains("Password") && !showPassword.wrappedValue{
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .fontWeight(.medium)
                            .foregroundColor(Color("Purple"))
                    })
                    .offset(y: 8)
                }
            }
            
            ,alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

