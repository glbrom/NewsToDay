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
    @ObservedObject var viewModel: RegisterViewModel
    
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    var title: LocalizedStringKey = "Welcome Back 👋"
    var subtitle: LocalizedStringKey = "I am happy to see you again. You can continue where you left off by logging in"
    var promptEmail: LocalizedStringKey =  "Email Adress"
    var promptPassword: LocalizedStringKey = "Password"
    var buttonText: LocalizedStringKey = "Sign In"
    var noAccount: LocalizedStringKey = "Don’t have an account?"
    var registerText: LocalizedStringKey = "Sign Up"
    var error: String = "Error"
    var ok: String = "OK"
   
    // MARK: - Body
    var body: some View {
           NavigationView {
               VStack {
                   TitleWithDescription(title: title, description: subtitle)
                       .padding(.top, 28)
                   
                   VStack(spacing: 16) {
                       CustomTextField(
                        text: $viewModel.email, icon: Constants.Icons.envelope,
                        placeholder: promptEmail
                       )
                       
                       CustomTextField(
                        text: $viewModel.password, icon: Constants.Icons.padlock,
                        placeholder: promptPassword,
                           isSecure: true
                       )
                   }
                   .padding(.horizontal, 20)
                   .padding(.top, 32)
                   
                   ActionButtonView(buttonText: buttonText, action: {}, action2: viewModel.LogIn)
                       .padding(.top, 64)
                   
                   Spacer()
                   
                   HStack {
                       Text(noAccount)
                           .foregroundColor(.blackLighter)
                           .font(.interFont(.medium, size: 16))
                       Button(action: {viewModel.navigateToSignUp = true}) {
                           Text(registerText)
                               .foregroundColor(.blackPrimary)
                               .font(.interFont(.medium, size: 16))
                       }
                   }
                   .padding(.bottom, 8)
               }
               .alert(isPresented: $viewModel.showAlert) {
                   Alert(title: Text(error), message: Text(viewModel.alertMessage), dismissButton: .default(Text(ok)))
               }
               .background(
                NavigationLink(destination: MainTabView(), isActive: $viewModel.navigateToMainTab) {
                       EmptyView()
                   }
                   .hidden()
               )
               .background(
                NavigationLink(destination: SignUp(viewModel: RegisterViewModel()), isActive: $viewModel.navigateToSignUp) {
                                 EmptyView()
                             }
                             .hidden()
                         )
           }
           .navigationBarBackButtonHidden(true)
       }
   }

   #Preview {
       LoginPageView(viewModel: RegisterViewModel())
   }
