//
//  ProfileView.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    // MARK: - Properties
    @State private var showOnBoarding = false
    @State private var showLanguageView = false
    @State private var showTermsConditionsView = false
    @ObservedObject var viewModel: RegisterViewModel
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    // MARK: - Body
    var body: some View {
        VStack {
            // Title
            TitleWithDescription(title: "Profile", description: "")
                .padding(.top, 28)
            
            // ImageProfile email
            HeaderView(viewModel:  viewModel)
                .padding(.top, 16)
            
            // Button - Language
            Button(action: {
                withAnimation {
                    showLanguageView.toggle()
                }
            }) {
                buttonView(title: "Language", icon: Constants.Icons.rightArrow)
            }
            .padding(.top, 44)
            
            Spacer()
            
            // Button - Terms & Conditions
            Button(action: {
                withAnimation {
                    showTermsConditionsView.toggle()
                }
            }) {
                buttonView(title: "Terms & Conditions", icon: Constants.Icons.rightArrow)
            }
            .padding(.bottom, 18)
            
            // Button - Sign Out
            Button(action: {
                viewModel.signOut()
                withAnimation {
                    showOnBoarding.toggle()
                }
            }) {
                buttonView(title: "Sign Out", icon: Constants.Icons.signOut)
            }
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 20)
        
        .background(
            Group {
                NavigationLink(
                    destination: LanguageView(),
                    isActive: $showLanguageView,
                    label: { EmptyView() }
                )
                
                NavigationLink(
                    destination: TermsConditionsView(),
                    isActive: $showTermsConditionsView,
                    label: { EmptyView() }
                )
            }
        )
        
        .fullScreenCover(isPresented: $showOnBoarding) {
            OnBoarding()
        }
    }
    
    // MARK: - Methods
    private func buttonView(title: String, icon: Image) -> some View {
        HStack {
            Text(title)
                .font(.interFont(.semiBold, size: 16))
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                .padding(.leading, 24)
                .padding(5)
                .foregroundStyle(.greyDark)
            
            Spacer()
            
            icon
                .frame(width: 24, height: 24)
                .padding(.trailing, 16)
        }
        .background(.greyLighter)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
}

#Preview {
    ProfileView(viewModel: RegisterViewModel())
}
