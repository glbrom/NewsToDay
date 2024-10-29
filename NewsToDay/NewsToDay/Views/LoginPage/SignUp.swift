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
    @ObservedObject var viewModel: RegisterViewModel
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
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
                    CustomTextField(text: $viewModel.username, icon: Constants.Icons.profile, placeholder: usernameText)
                        .autocapitalization(.none)
                    CustomTextField(text: $viewModel.email, icon: Constants.Icons.envelope, placeholder: promptEmail)
                        .autocapitalization(.none)
                    CustomTextField(text: $viewModel.password, icon: Constants.Icons.padlock, placeholder: promptPassword, isSecure: true)
                        .autocapitalization(.none)
                    CustomTextField(text: $viewModel.confirmPassword, icon: Constants.Icons.padlock, placeholder: promptConfirm, isSecure: true)
                        .autocapitalization(.none)
                    
                    if let error = viewModel.passwordMatchError {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.interFont(.regular, size: 14))
                            .padding(.leading, 20)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 32)
                
                ActionButtonView(buttonText: buttonText, action: checkPasswordMatch, action2: viewModel.register)
                    .padding(.top, 16)
                
                Spacer()
                
                HStack {
                    Text(haveAccount)
                        .foregroundColor(.blackLighter)
                    Button(action: { viewModel.navigateToLogin = true}) {
                        Text(signIn)
                            .foregroundColor(.blackPrimary)
                    }
                }
                .padding(.bottom, 8)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(error), message: Text( viewModel.alertMessage), dismissButton: .default(Text(ok)))
            }
            .background(
                NavigationLink(destination: MainTabView(), isActive: $viewModel.navigateToMainTab) {
                    EmptyView()
                }
                .hidden()
            )
            .background(
                NavigationLink(destination: LoginPageView(viewModel: RegisterViewModel()), isActive: $viewModel.navigateToLogin) {
                              EmptyView()
                          }
                          .hidden()
                      )
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Functions
    private func checkPasswordMatch() {
        if viewModel.password == viewModel.confirmPassword {
            viewModel.passwordMatchError = nil
        } else {
            viewModel.passwordMatchError = matchError
        }
    }
    
}

#Preview {
    SignUp(viewModel: RegisterViewModel())
}
