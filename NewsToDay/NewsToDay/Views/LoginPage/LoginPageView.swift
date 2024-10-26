//
//  LoginPageView.swift
//  NewsToDay
//
//  Created by Roman Golub on 25.10.2024.
//

import SwiftUI
import FirebaseAuth
struct LoginPageView: View {
    // MARK: - Properties
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var alertMessage  = ""
    @State private var showAlert = false
    @State private var navigateToMainTab = false
    @State private var navigateToSignUp = false
    
    
    
    var title: LocalizedStringKey = "Welcome Back 👋"
var subtitle: LocalizedStringKey = "I am happy to see you again. You can continue where you left off by logging in"
    var promptEmail: LocalizedStringKey =  "Email Adress"
    var promptPassword: LocalizedStringKey = "Password"
    var buttonText: LocalizedStringKey = "Sign In"
    var noAccount: LocalizedStringKey = "Don’t have an account?"
    var registerText: LocalizedStringKey = "Sign Up"
    var error: String = "Error"
    var emailAlert: String = "Please enter your email and password."
    var ok: String = "OK"
    var body: some View {
        // MARK: - Body
           NavigationView {
               VStack {
                   VStack(alignment: .leading) {
                       Text(title)
                           .foregroundColor(.blackPrimary)
                           .font(.interFont(.semiBold, size: 24))
                           .frame(width: 216, alignment: .topLeading)
                           .padding(.top, 72)
                           .offset(y: -4)
                       
                       Text(subtitle)
                           .foregroundColor(.greyPrimary)
                           .frame(width: 336, alignment: .leading)
                   }
                   .padding(.leading, 20)
                   
                   VStack(spacing: 16) {
                       CustomTextField(
                           icon: Constants.Icons.envelope,
                           placeholder: promptEmail,
                           text: $email
                       )
                       
                       CustomTextField(
                           icon: Constants.Icons.padlock,
                           placeholder: promptPassword,
                           text: $password,
                           isSecure: true
                       )
                   }
                   .padding(.horizontal, 20)
                   .padding(.top, 32)
                   
                   ActionButtonView(buttonText: buttonText, action: {}, action2: LogIn)
                       .padding(.top, 64)
                   
                   Spacer()
                   
                   HStack {
                       Text(noAccount)
                           .foregroundColor(.blackLighter)
                       Button(action: {navigateToSignUp = true}) {
                           Text(registerText)
                               .foregroundColor(.blackPrimary)
                       }
                   }
                   .padding(.bottom, 8)
               }
               .alert(isPresented: $showAlert) {
                   Alert(title: Text(error), message: Text(alertMessage), dismissButton: .default(Text(ok)))
               }
               .background(
                   NavigationLink(destination: MainTabView(), isActive: $navigateToMainTab) {
                       EmptyView()
                   }
                   .hidden()
               )
               .background(
                             NavigationLink(destination: SignUp(), isActive: $navigateToSignUp) {
                                 EmptyView()
                             }
                             .hidden()
                         )
           }
       }
    
    private func LogIn() {
        if email.isEmpty || password.isEmpty {
            alertMessage = emailAlert
               showAlert = true
               return
           }
        
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                alertMessage = error.localizedDescription
                showAlert = true
            } else {
                navigateToMainTab = true
            }
        }
    }
   }

   #Preview {
       LoginPageView()
   }
