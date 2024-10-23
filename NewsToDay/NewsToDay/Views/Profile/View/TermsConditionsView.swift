//
//  TermsConditionsView.swift
//  NewsToDay
//
//  Created by Serge Eliseev on 23.10.2024.
//

import SwiftUI

struct TermsConditionsView: View {
    
@Environment(\.presentationMode) var presentationMode
    
var textTermsConditions: String =
 """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. 

Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
"""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(textTermsConditions)
                        .font(.title3)
                        .foregroundColor(.greyDark)
                }
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("ArrowLeft")
                        }
                        .padding()
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Terms & Conditions")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                .navigationBarBackButtonHidden(false)
                .padding(.horizontal)
            }
        }
    }
}

    
#Preview {
    TermsConditionsView()
}

