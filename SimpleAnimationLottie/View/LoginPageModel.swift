//
//  LoginPageModel.swift
//  SimpleAnimationLottie
//
//  Created by Muhammad Arzu on 06/02/24.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    func Login(){
        
    }
    func Register(){
        
    }
    func ForgotPassword(){
        
    }
    
}

