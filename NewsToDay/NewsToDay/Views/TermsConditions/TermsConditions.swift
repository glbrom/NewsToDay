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
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    var textTermsConditions: String =
 """
Welcome to NewsToDay! These Terms and Conditions ("Terms") govern your use of our mobile application (the "App") and any related services provided by NewsToDay ("we," "us," or "our"). By downloading, accessing, or using the App, you agree to be bound by these Terms. If you do not agree, please uninstall the App and discontinue use of our services.

1. Use of the App
NewsToDay provides curated news articles and information for informational purposes only. The content is sourced from third parties, and we do not endorse, guarantee, or assume responsibility for the accuracy, reliability, or completeness of any information available on the App.
You agree to use the App only for personal, non-commercial purposes and in compliance with all applicable laws and regulations.

2. User Accounts
You may need to create an account to access certain features. You agree to provide accurate, current, and complete information during the registration process and keep this information up-to-date.
You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. Notify us immediately if you suspect any unauthorized use of your account.

3. Intellectual Property
All content on the App, including text, graphics, logos, images, and software, is the property of NewsToDay or its licensors and is protected by copyright, trademark, and other intellectual property laws.
You are granted a limited, non-exclusive, non-transferable, and revocable license to access and use the App for personal use only. You may not reproduce, distribute, modify, or create derivative works from the content without our prior written consent.

4. Third-Party Links
The App may contain links to third-party websites or services that are not owned or controlled by NewsToDay. We have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third-party sites or services.
You acknowledge and agree that NewsToDay shall not be liable for any damage or loss caused by your use of any third-party sites or services.

5. Prohibited Activities
When using the App, you agree not to:
Engage in any activity that interferes with or disrupts the App's functionality or security.
Use the App for any illegal or unauthorized purpose.
Attempt to access or collect data not intended for you or that you do not have permission to access.
Misrepresent your identity or affiliation with any entity or person.

6. Privacy
Our Privacy Policy, which explains how we collect, use, and share your information, is an integral part of these Terms. By using the App, you consent to the collection and use of information as outlined in our Privacy Policy.

7. Disclaimers and Limitation of Liability
NewsToDay provides the App on an "as-is" and "as-available" basis without any warranties of any kind, either express or implied, including, but not limited to, implied warranties of merchantability, fitness for a particular purpose, or non-infringement.
We do not warrant that the App will be uninterrupted, secure, or free from errors or viruses. Your use of the App is at your sole risk.
In no event shall NewsToDay be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with your use or inability to use the App.

8. Indemnification
You agree to indemnify, defend, and hold harmless NewsToDay and its affiliates, directors, officers, employees, and agents from and against any claims, liabilities, damages, losses, and expenses, including reasonable legal fees, arising from your use of the App or violation of these Terms.

9. Termination
We reserve the right to terminate or suspend your account or access to the App at our discretion, without notice, for conduct that we believe violates these Terms or is otherwise harmful to other users or the App.

10. Governing Law
These Terms are governed by and construed in accordance with the laws of the Russian Federation. You agree to submit to the exclusive jurisdiction of the courts of the Russian Federation to resolve any disputes or claims arising from these Terms.

11. Changes to the Terms
We may update these Terms from time to time. Any changes will be posted on this page, and your continued use of the App after any changes indicates your acceptance of the updated Terms.

12. Contact Us
If you have any questions about these Terms or the App, please contact us at ilias.abdv@gmail.com.

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
