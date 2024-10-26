//
//  TermsConditionsView.swift
//  NewsToDay
//
//  Created by Serge Eliseev on 23.10.2024.
//

import SwiftUI

struct TermsConditionsView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    var textTermsConditions: String =
 """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.

Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
"""
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Constants.Icons.leftArrow
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 20)
                
                Text("Terms & Conditions")
                    .font(.interFont(.semiBold, size: 24))
                    .padding(.trailing, 74)
                    .padding(.leading, 30)
                
            }
            .padding(.top, 24)
            
            ScrollView {
                VStack {
                    Text(textTermsConditions)
                        .font(.interFont(.regular, size: 16))
                        .lineSpacing(5)
                        .foregroundColor(.greyPrimary)
                        .frame(width: 336, alignment: .topLeading)
                    
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
            }
            .navigationBarHidden(true)
        }
        .background(.white)
    }
}

#Preview {
    TermsConditionsView()
}
