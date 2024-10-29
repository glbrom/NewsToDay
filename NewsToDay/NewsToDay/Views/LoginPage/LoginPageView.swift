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
                       Button(action: {viewModel.navigateToSignUp = true}) {
                           Text(registerText)
                               .foregroundColor(.blackPrimary)
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
