//
//  ContentView.swift
//  Tokenization Demo
//
//  Created by jay prakash on 16/09/2024.
//

import SwiftUI
import Combine


@available(iOS 15.0, *)


struct SignUpView: View {
    
    @State private var fullName: String = ""
    @State private var jobRole: String = ""
    @FocusState private var focusedField: Field?
    @State private var isTypingFullName: Bool = false // Track typing for fullName
    @State private var isTypingJobRole: Bool = false // Track typing for jobRole
    @State private var showWelcomeView: Bool = false // State to present WelcomeView

    
    enum Field {
        case fullName
        case jobRole
    }
        

    var body: some View {
        VStack(spacing: 14) {
            // Title
            Text("Sign up")
                .textStyleLargeTitle()
                .foregroundColor(.Token.black)
                .padding(.top, 50)

            // Subtitle
            Text("Sign up to see the magic")
                .textStyleSubHeadline()
                .foregroundColor(.Token.systemGray2)
                .padding(.bottom, 40)

            // Full Name TextField
            VStack(alignment: .leading) {
                Text("Full Name")
                    .textStyleFootnote()
                    .foregroundColor(.Token.systemGray2)
                    .padding(.horizontal)

                CustomTextField(
                    placeholder: "Full Name",
                    text: $fullName,
                    font: isTypingFullName,                  placeholderColor: .Token.systemGray2,
                    borderColor: focusedField == .fullName ? .Token.black : .Token.systemGray5
                )
                .focused($focusedField, equals: .fullName)
                .padding(.horizontal)
                .onChange(of: fullName) { newValue in
                    isTypingFullName = !newValue.isEmpty
                }
            }

            Spacer().frame(height: 2)

            // Job Role TextField
            VStack(alignment: .leading) {
                Text("Job Role Name")
                    .textStyleFootnote()
                    .foregroundColor(.Token.systemGray2)
                    .padding(.horizontal)

                CustomTextField(
                    placeholder: "Job Role",
                    text: $jobRole,
                    font: isTypingJobRole,
                    placeholderColor: .Token.systemGray2,
                    borderColor: focusedField == .jobRole ? .Token.black : .Token.systemGray5
                )
                .focused($focusedField, equals: .jobRole)
                .padding(.horizontal)
                .onChange(of: jobRole) { newValue in
                    isTypingJobRole = !newValue.isEmpty
                }
            }

            Spacer() // Push everything to the top

            Divider()
                .padding(.horizontal, 0)

            // Confirm Button
            Button(action: {
                if !fullName.isEmpty && !jobRole.isEmpty {
                    showWelcomeView = true
                }
            }) {
                Text("Confirm")
                    .textStyleBody()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(fullName.isEmpty || jobRole.isEmpty ? Color.Token.systemGray5 : Color.Token.kfhBrand)
                    .foregroundColor(fullName.isEmpty || jobRole.isEmpty ? .Token.disabled : .Token.black)
                    .cornerRadius(CGFloat (AppMeasures.borderRadiusRadiusSmall))
                    .padding(.horizontal, 20)
            }
            .disabled(fullName.isEmpty || jobRole.isEmpty)
            .padding(.bottom, 20) // Adjust padding if necessary
        }
        .padding(.bottom, 10) // Add bottom padding for better spacing
        .fullScreenCover(isPresented: $showWelcomeView) {
            ConfirmationView() // Present the next screen
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            SignUpView()
                .previewDevice("iPhone 11 Pro Max")
        } else {
            // Fallback on earlier versions
        }
    }
}


@available(iOS 15.0, *)
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var font: Bool
    var placeholderColor: Color
    var borderColor: Color
    
    @FocusState var isFocused: Bool?
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                if font {
                    Text(placeholder)
                        .textStyleBody()
                        .foregroundColor(placeholderColor)
                        .padding(.horizontal, 16) // Adjust padding to match the TextField
                        .padding(.vertical, 12) // Adjust vertical padding
                }
                else {
                    Text(placeholder)
                        .textStyleCallout()
                        .foregroundColor(placeholderColor)
                        .padding(.horizontal, 16) // Adjust padding to match the TextField
                        .padding(.vertical, 12) // Adjust vertical padding
                }
            }
            
                TextField("", text: $text)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: CGFloat(AppMeasures.borderRadiusRadiusSmall))
                            .stroke(borderColor, lineWidth: 1.25)
                    )
        }
    }
}
