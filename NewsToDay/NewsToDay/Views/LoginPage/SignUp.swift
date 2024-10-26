//
//  CustomTextField.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/25/24.
//

import SwiftUI
import FirebaseAuth

struct SignUp: View {
    // MARK: - Properties
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var passwordMatchError: String? = nil
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToMainTab = false
    @State private var navigateToLogin = false
    
    var usernameText: LocalizedStringKey = "Username"
    var promptEmail: LocalizedStringKey = "Email Address"
    var promptPassword: LocalizedStringKey = "Password"
    var promptConfirm: LocalizedStringKey = "Repeat Password"
    var buttonText: LocalizedStringKey = "Sign Up"
    var haveAccount: LocalizedStringKey = "Already have an account?"
    var signIn: LocalizedStringKey = "Sign In"
    
    var title: LocalizedStringKey = "Welcome to NewsToDay"
    var subtitle: LocalizedStringKey = "Hello, I guess you are new around here. You can start using the application after sign up."
    var matchError: String = "Passwords do not match."
    var error: String = "Error"
    var ok: String = "OK"
    var body: some View {
        // MARK: - Body
        NavigationView {
            VStack {
                VStack(spacing: 16) {
                    Text(title)
                        .foregroundColor(.blackPrimary)
                        .font(.interFont(.semiBold, size: 24))
                        .frame(width: 336, alignment: .leading)
                        .padding(.top, 72)
                    
                    Text(subtitle)
                        .foregroundColor(.greyPrimary)
                        .font(.interFont(.regular, size: 16))
                        .frame(width: 336, alignment: .leading)
                        .padding(.top, 8)
                        .offset(y: -4)
                }
                .padding(.leading, 20)
                
                VStack(spacing: 16) {
                    CustomTextField(icon: Constants.Icons.profile, placeholder: usernameText, text: $username)
                    CustomTextField(icon: Constants.Icons.envelope, placeholder: promptEmail, text: $email)
                    CustomTextField(icon: Constants.Icons.padlock, placeholder: promptPassword, text: $password, isSecure: true)
                    CustomTextField(icon: Constants.Icons.padlock, placeholder: promptConfirm, text: $confirmPassword, isSecure: true)
                    
                    if let error = passwordMatchError {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.interFont(.regular, size: 14))
                            .padding(.leading, 20)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 32)
                
                ActionButtonView(buttonText: buttonText, action: checkPasswordMatch, action2: register)
                    .padding(.top, 16)
                
                Spacer()
                
                HStack {
                    Text(haveAccount)
                        .foregroundColor(.blackLighter)
                    Button(action: { navigateToLogin = true}) {
                        Text(signIn)
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
                          NavigationLink(destination: LoginPageView(), isActive: $navigateToLogin) {
                              EmptyView()
                          }
                          .hidden()
                      )
        }
    }
    
    // MARK: - Functions
    
    private func checkPasswordMatch() {
        if password == confirmPassword {
            passwordMatchError = nil
        } else {
            passwordMatchError = matchError
        }
    }
    
    private func register() {
        guard passwordMatchError == nil else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
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
    SignUp()
}
