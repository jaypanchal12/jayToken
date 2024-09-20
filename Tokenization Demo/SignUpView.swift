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
                .font(.textStyleLargeTitle())
                .foregroundColor(.token.black)
                .padding(.top, 50)

            // Subtitle
            Text("Sign up to see the magic")
                .font(.textStyleSubHeadline())
                .foregroundColor(.token.systemGray2)
                .padding(.bottom, 40)

            // Full Name TextField
            VStack(alignment: .leading) {
                Text("Full Name")
                    .font(.textStyleFootnote())
                    .foregroundColor(.token.systemGray2)
                    .padding(.horizontal)

                CustomTextField(
                    placeholder: "Full Name",
                    text: $fullName,
                    font: isTypingFullName ? .textStyleBody() : .textStyleCallout(),
                    placeholderColor: .token.systemGray2,
                    borderColor: focusedField == .fullName ? .token.black : .token.systemGray5
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
                    .font(.textStyleFootnote())
                    .foregroundColor(.token.systemGray2)
                    .padding(.horizontal)

                CustomTextField(
                    placeholder: "Job Role",
                    text: $jobRole,
                    font: isTypingJobRole ? .textStyleBody() : .textStyleCallout(),
                    placeholderColor: .token.systemGray2,
                    borderColor: focusedField == .jobRole ? .token.black : .token.systemGray5
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
                    .font(.textStyleBody())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(fullName.isEmpty || jobRole.isEmpty ? Color.token.systemGray5 : Color.token.kfhBrand)
                    .foregroundColor(fullName.isEmpty || jobRole.isEmpty ? Color.token.disabled : Color.token.black)
                    .cornerRadius(AppMeasures.borderRadiusRadiusSmall)
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
    var font: Font
    var placeholderColor: Color
    var borderColor: Color
    
    @FocusState var isFocused: Bool?
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .font(font)
                    .foregroundColor(placeholderColor)
                    .padding(.horizontal, 16) // Adjust padding to match the TextField
                    .padding(.vertical, 12) // Adjust vertical padding
            }
            TextField("", text: $text)
                .font(font)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: AppMeasures.borderRadiusRadiusSmall)
                        .stroke(borderColor, lineWidth: 1.25)
                )
        }
    }
}
